module Symmetric

  def self.encrypt(key, message)
    box = RbNaCl::SimpleBox.from_secret_key(key)
    box.box(message)
  end

  def self.decrypt(key, ciphertext)
    box = RbNaCl::SimpleBox.from_secret_key(key)
    box.open(ciphertext)
  end

end
