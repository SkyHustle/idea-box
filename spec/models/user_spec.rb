require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: "bob", password: "baram")}

  it 'is valid' do
    expect(user).to be_valid  
  end

  it 'if username exists, new username is not valid' do
    user1 = User.new(username: "bob")
    expect(user1).to_not be_valid
  end

  it 'is not valid with no name' do
    user.username = nil
    expect(user).to_not be_valid
  end
end
