class EncryptedAttribute

  def initialize(passphrase, value)
    passphrase_hash = RbNaCl::Hash.sha256(passphrase)
    @ciphertext = Symmetric.encrypt(passphrase_hash, value)
  end

  def value(passphrase)
    passphrase_hash = RbNaCl::Hash.sha256(passphrase)
    Symmetric.decrypt(passphrase_hash, @ciphertext)
  end

end
