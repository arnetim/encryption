class SharingUser < User

  def initialize(username, password)
    super(username, password)

    private_key = RbNaCl::PrivateKey.generate
    @encrypted_private_key = EncryptedAttribute.new(password, private_key)
    @public_key = private_key.public_key
  end

  def private_key(password)
    @encrypted_private_key.value(password)
  end

  def public_key
    @public_key
  end

  def share_content_key_with(other_user)

    # TODO: implement this method
    # - get the contentKey of the logged in user
    # - get the privateKey of the logged in user (hint you should add this to Application.session)
    # - encrypt the content_key for other_user, using his / her public key
    # - store the contentKey of the logged in user in a map of shared_content_keys for other_user

  end

  def get_shared_content_key(other_user)

    # TODO: implement this method
    # - get the (encrypted) content_key from the map of shared_content_keys
    # - decrypt the content key

  end

end
