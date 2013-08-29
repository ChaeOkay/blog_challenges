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

  def authenticate(user)
    check_username(user)
    check_password(user)
    check_errors(user)
  end

  def check_username(user)
    user.log_username_error if user.username.nil?
  end

  def check_password(user)
    user.log_password_error if user.password != params[:password]
  end

  def check_errors(user)
    if user.errors.messages.empty?
      session[:user_id] = user.id
      redirect '/posts'
    else
      erb :index
    end
  end

end
