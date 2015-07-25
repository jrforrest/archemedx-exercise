require 'rails_helper'

describe Post do
  it 'has a working factory' do
    expect(build(:post)).to be_valid
  end
end
