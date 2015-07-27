require 'rails_helper'

describe 'Viewing a post' do
  let(:post) { create(:post, :with_comments) }
  before { visit post_path(post) }

  it 'renders the post' do
    expect(page).to have_content(post.content[0..40])
  end

  it 'renders the posts comments' do
    expect(page).to have_content(post.comments.first.body)
  end

  context 'with nested comments' do
    let(:nested_comment) { build(:comment) }

    before do
      post.comments.first.comments << nested_comment
      visit post_path(post)
    end

    it 'renders the nested comment' do
      expect(page).to have_content(nested_comment.body)
    end
  end
end
