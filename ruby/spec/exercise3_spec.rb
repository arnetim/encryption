require 'spec_helper'

describe Application do

  before do
    @application = Application.new

    Users.clear
    Users.add('user', 'a password')
  end

  it 'fails decrypting content key with incorrect login' do
    expect {
      @application.login('user', 'other password')
    }.to raise_error(RbNaCl::CryptoError)
  end

  it 'decrypts personal information' do
    @application.login('user', 'a password')
    user = Users.get('user')
    user.name = 'a developer'
    user.gender = 'm'

    expect(user.name).to eq('a developer')
    expect(user.gender).to eq('m')
  end

end
