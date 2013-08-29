helpers do

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def username_taken?(username)
    !User.find_by_username(username).nil?
  end

  def password_not_confirmed?(params)
    params[:password] != params[:password_confirmation]
  end

end
