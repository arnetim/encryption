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

    return nil

    # TODO: extent this method for exercise 4
    # - return the shared content key of another user if available

  end

  def private_key
    @current_user_private_key
  end

end
