helpers do

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def start_session(user)
    (session[:user_id] = user.id) unless (user.id.nil? || user.errors?)
    user.errors? ? (erb :index) : (redirect '/posts')
  end

end
