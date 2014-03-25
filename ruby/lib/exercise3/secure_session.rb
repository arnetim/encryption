class SecureSession

  def initialize(current_user, current_user_content_key, current_user_private_key)
    @current_user = current_user
    @current_user_content_key = current_user_content_key
    @current_user_private_key = current_user_private_key
  end

  def content_key(user)
    if user == @current_user
      return @current_user_content_key
    end

    @current_user.get_shared_content_key(user)
  end

  def private_key
    @current_user_private_key
  end

end
