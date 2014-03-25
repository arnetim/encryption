class User

  def initialize(username, password)
    @username = username

    # TODO: implement this method
    # - create a new contentKey (tip: use RbNaCl::Random.random_bytes)
    # - the contenKey should be encrypted with the password of the user
    # - use EncryptedAttribute for storing an encrypted value

  end

  def username
    @username
  end

  def content_key(password)

    # TODO: implement this method

  end

  def name=(value)

    # TODO: implement this method
    # - store the name in an EncryptedAttribute
    # - the name should be encrypted with the contentKey of the user
    # - hint: the contentKey is stored in the session of the user

  end

  def name

    # TODO: implement this method

  end

  def gender=(value)
    @gender = value
  end

  def gender
    @gender
  end

end
