require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).to be_invalid
  end

  it 'is invalid with a duplicate email' do
    existing_user = create(:user)
    user.email = existing_user.email
    expect(user).to be_invalid
  end

  it 'is invalid without a name' do
    user.name = nil
    expect(user).to be_invalid
  end

  it 'is invalid without a password digest' do
    user.password_digest = nil
    expect(user).to be_invalid
  end
end
