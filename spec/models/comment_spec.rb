require 'rails_helper'

describe Comment do
  it 'has a valid factory' do
    expect(build(:comment)).to be_valid
    expect(build(:comment, :nested)).to be_valid
  end

  it 'validates presence of body' do
    expect(build(:comment, body: '')).to_not be_valid
  end

  it 'can have comments' do
    parent = create(:comment)
    parent.comments << build(:comment)
    expect(parent.comments.count).to be > 0
  end
end
