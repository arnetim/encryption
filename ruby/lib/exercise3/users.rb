module Users

  @users = []

  def self.add(username, password)
    @users << SharingUser.new(username, password)
  end

  def self.get(username)
    @users.select{|user| user.username == username}.first
  end

  def self.clear
    @users = []
  end

end
