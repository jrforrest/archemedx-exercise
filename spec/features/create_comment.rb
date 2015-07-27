require 'rails_helper'

describe 'Creatinng a post comment' do
  let(:post) { create(:post) }
  let(:comment_text) { 'My settlers own Catan.' }

  context 'under the post' do
    let(:body_input) { first(:css, ".comment_body textarea") }

    before do
      visit post_path(post)
      body_input.set(comment_text)
      click_button 'Create Comment'
    end

    it 'populates the post page with the new comment' do
      expect(page).to have_content(comment_text)
    end

    it 'Adds the comment to the post' do
      expect(post.comments.count).to be > 0
    end
  end

  context 'under another comment' do
    let!(:comment) { create(:comment, parent: post) }
    let(:nested_body_input) do
      find(:css, '.comment .new-comment .comment_body textarea')
    end
    let(:submit_button) do
      find(:css, '.comment .new-comment input.button')
    end
    let(:nested_comment_text) { 'My settlers own Catan.' }

    before do
      visit post_path(post)
      nested_body_input.set(nested_comment_text)
      submit_button.click
    end

    it 'populates the post page with the new comment' do
      expect(page).to have_content(nested_comment_text)
    end

    it 'adds the comment to the parent comment' do
      expect(comment.comments.count).to be > 0
    end
  end
end
