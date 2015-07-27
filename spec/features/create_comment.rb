require 'rails_helper'

describe 'Creatinng a post comment' do
  let(:post) { create(:post) }
  let(:comment_text) { 'Woah there, hello world!' }

  before do
    visit post_path(post)
    fill_in 'Comment', with: comment_text
    click_button 'Submit Comment'
  end

  it 'populates the post page with the new comment' do
    expect(page).to have_content(comment_text)
  end
end
