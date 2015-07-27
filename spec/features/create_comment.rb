require 'rails_helper'

describe 'Creatinng a post comment' do
  let(:post) { create(:post) }
  let(:comment_text) { 'Woah there, hello world!' }
  let(:body_input) { first(:css, "input.text.comment_body") }

  before do
    visit post_path(post)
    fill_in body_input, with: comment_text
    click_button 'Create Comment'
  end

  it 'populates the post page with the new comment' do
    expect(page).to have_content(comment_text)
  end

  it 'Adds the comment to the post' do
    expect(post.comments.count).to be > 0
  end
end
