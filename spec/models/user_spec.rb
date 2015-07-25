require 'rails_helper'

describe User do
  it 'has a working factory' do
    expect(build(:user)).to be_valid
  end
end
