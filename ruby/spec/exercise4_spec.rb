require 'spec_helper'

describe Application do

  before do
    @application = Application.new

    Users.clear
    Users.add('user', 'a password')
    Users.add('another user', 'other password')

    @application.login('user', 'a password')
    user = Users.get('user')
    user.name = 'a developer'
    user.gender = 'm'
  end

  it 'should be possible to read unencrypted information of other users' do
    @application.login('another user', 'other password')
    user = Users.get('user')

    user.gender.should eql('m')
  end

  it 'should not be possible to read encrypted personal information without sharing keys' do
    @application.login('another user', 'other password')
    user = Users.get('user')

    expect {
      user.name.should eql('a developer')
    }.to raise_error
  end

  it 'should be possible to read encrypted personal information after sharing keys' do
    user = Users.get('user')
    other_user = Users.get('another user')
    user.share_content_key_with(other_user)

    @application.login('another user', 'other password')
    user = Users.get('user')
    user.name.should eql('a developer')
  end

end
