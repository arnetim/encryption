require 'spec_helper'

describe Symmetric do

  before do
    @key = RbNaCl::Hash.sha256('a random key')
    @message = 'a message'
  end

  it 'decryptes a symmetrically encrypted message' do
    encrypted_message = Symmetric.encrypt(@key, @message)
    decrypted_message = Symmetric.decrypt(@key, encrypted_message)

    decrypted_message.expect eql(@message)
  end

end
