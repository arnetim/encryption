class User

  def initialize(username, password)
    @username = username

    content_key = RbNaCl::Random.random_bytes
    @encrypted_content_key = EncryptedAttribute.new(password, content_key)
  end

  def username
    @username
  end

  def content_key(password)
    @encrypted_content_key.value(password)
  end

  def name=(value)
    content_key = Application.session.content_key(self)
    @encrypted_name = EncryptedAttribute.new(content_key, value)
  end

  def name
    content_key = Application.session.content_key(self)
    @encrypted_name.value(content_key)
  end

  def gender=(value)
    @gender = value
  end

  def gender
    @gender
  end

end
