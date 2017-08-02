require 'spec_helper'

describe Asymmetric do

  before do
    @sender_private_key = RbNaCl::PrivateKey.generate
    @sender_public_key = @sender_private_key.public_key
    @receiver_private_key = RbNaCl::PrivateKey.generate
    @receiver_public_key = @receiver_private_key.public_key

    @message = 'a message'
  end

  it 'decryptes an asymmetrically encrypted message' do
    encrypted_message = Asymmetric.encrypt(@receiver_public_key, @sender_private_key, @message)
    decrypted_message = Asymmetric.decrypt(@receiver_private_key, @sender_public_key, encrypted_message)

    expect(decrypted_message).to eq(@message)
  end

end
