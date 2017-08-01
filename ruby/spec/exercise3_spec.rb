require 'spec_helper'

describe Application do

  before do
    @application = Application.new

    Users.clear
    Users.add('user', 'a password')
  end

  it 'fails decrypting without login' do
    user = Users.get('user')

    expect {
      user.name = 'a developer'
    }.to raise_error
  end

  it 'decrypts personal information' do
    @application.login('user', 'a password')

    user = Users.get('user')
    user.name = 'a developer'
    user.gender = 'm'

    user.name.expect eql('a developer')
    user.gender.expect eql('m')
  end

end
