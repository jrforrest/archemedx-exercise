require 'rails_helper'

describe 'deleting a comment' do
  let(:post) { create(:post) }
  let!(:comment) { create(:comment, parent: post) }

  before do
    visit post_path(post)
    click_link 'Delete'
  end

  it 'marks the comment as deleted' do
    expect(comment.reload).to be_soft_deleted
  end

  it 'does not render the comment on the post page' do
    expect(page).not_to have_content(comment.body)
  end
end
