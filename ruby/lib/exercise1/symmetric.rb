module Symmetric

  def self.encrypt(key, message)
    box = RbNaCl::SimpleBox.from_secret_key(key)
    box.box(message)
  end

  def self.decrypt(key, ciphertext)

    # TODO: implement this method
    # - take a look at the implementation of the #encrypt method
    # - use box.open

  end

end
