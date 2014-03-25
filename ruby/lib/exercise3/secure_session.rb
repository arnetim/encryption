class SecureSession

  def initialize(current_user, current_user_content_key)
    @current_user = current_user
    @current_user_content_key = current_user_content_key
  end

  def content_key(user)
    if user == @current_user
      return @current_user_content_key
    end

    return nil
  end

end
