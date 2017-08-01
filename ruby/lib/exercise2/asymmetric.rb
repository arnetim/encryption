module Asymmetric

  def self.encrypt(receiver_public_key, sender_private_key, message)
    box = RbNaCl::SecretBox.from_keypair(receiver_public_key, sender_private_key)
    box.encrypt(message)
  end

  def self.decrypt(receiver_private_key, sender_public_key, ciphertext)
    box = RbNaCl::SecretBox.from_keypair(sender_public_key, receiver_private_key)
    box.decrypt(ciphertext)
  end

end
