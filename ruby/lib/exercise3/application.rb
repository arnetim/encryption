class Application

  def login(username, password)
    user = Users.get(username)
    content_key = user.content_key(password)
    private_key = user.private_key(password)
    @@session = SecureSession.new(user, content_key, private_key)
  end

  def self.session
    @@session
  end

end
