class SharingUser < User

  def initialize(username, password)
    super(username, password)

    private_key = RbNaCl::PrivateKey.generate
    @encrypted_private_key = EncryptedAttribute.new(password, private_key)
    @public_key = private_key.public_key
    @shared_content_keys = {}
  end

  def private_key(password)
    @encrypted_private_key.value(password)
  end

  def public_key
    @public_key
  end

  def share_content_key_with(other_user)
    content_key = Application.session.content_key(self)
    private_key = Application.session.private_key

    encrypted_content_key = AsymmetricEncryptedAttribute.new(
      other_user.public_key, private_key, content_key)
    other_user.add_shared_content_key(@username, encrypted_content_key)
  end

  def get_shared_content_key(other_user)
    private_key = Application.session.private_key
    @shared_content_keys[other_user.username].value(private_key, other_user.public_key)
  end

  def add_shared_content_key(username, encrypted_content_key)
    @shared_content_keys[username] = encrypted_content_key
  end

end
