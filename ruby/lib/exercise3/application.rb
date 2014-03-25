class Application

  def login(username, password)
    user = Users.get(username)
    content_key = user.content_key(password)
    @@session = SecureSession.new(user, content_key)
  end

  def self.session
    @@session
  end

end
