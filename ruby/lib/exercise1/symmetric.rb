module Symmetric

  def self.encrypt(key, message)
    box = RbNaCl::SecretBox.from_secret_key(key)
    box.box(message)
  end

  def self.decrypt(key, ciphertext)
    box = RbNaCl::SecretBox.from_secret_key(key)
    box.open(ciphertext)
  end

end
