require 'rails_helper'

describe 'Viewing a post' do
  let(:post) { create(:post) }
  before { visit post_path(post) }

  it 'renders the post' do
    expect(page).to have_content(post.content[0..40])
  end
end
