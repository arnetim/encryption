class EncryptedAttribute

  def initialize(passphrase, value)

    # TODO: implement this method
    # - hash the passphrase, tip: use RbNaCl::Hash.sha256
    # - use exercise1.Symmetric#encrypt and store the encrypted attribute as an instance variable

    @encrypted_attribute = nil

  end

  def value(passphrase)

    # TODO: implement this method
    # - hash the passphrase, tip: use RbNaCl::Hash.sha256
    # - use exercise1.Symmetric#decrypt to decrypt the stored encrypted attribute

  end

end
