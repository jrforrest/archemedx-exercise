require 'rails_helper'

describe Post do
  it 'has a working factory' do
    expect(build(:post)).to be_valid
  end

  it 'can have comments' do
    post = create(:post)
    post.comments << build(:comment)
    expect(post.comments.count).to be > 0
  end
end
