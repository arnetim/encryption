class AsymmetricEncryptedAttribute

  def initialize(receiver_public_key, sender_private_key, value)
    @ciphertext = Asymmetric.encrypt(receiver_public_key, sender_private_key, value)
  end

  def value(receiver_private_key, sender_public_key)
    Asymmetric.decrypt(receiver_private_key, sender_public_key, @ciphertext)
  end

end
