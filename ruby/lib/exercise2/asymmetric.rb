module Asymmetric

  def self.encrypt(receiver_public_key, sender_private_key, message)
    box = RbNaCl::RandomNonceBox.from_keypair(receiver_public_key, sender_private_key)
    box.box(message)
  end

  def self.decrypt(receiver_private_key, sender_public_key, ciphertext)
    box = RbNaCl::RandomNonceBox.from_keypair(sender_public_key, receiver_private_key)
    box.open(ciphertext)
  end

end
