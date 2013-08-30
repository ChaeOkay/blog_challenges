get '/' do
  if current_user && logged_in?
    redirect '/posts'
  else
    erb :index
  end
end

post '/login' do
  session.clear
  @user = User.find_by_username(params[:username]) || User.new
  User.authenticate(@user, params[:password])

  (session[:user_id] = @user.id) unless @user.id.nil?
  @user.errors? ? (erb :index) : (redirect '/posts')
end

post '/signup' do
  #nested params
  @user = User.new(params[:signup])
  @user.authenticate_new_user(params[:signup])

  if @user.errors?
    erb :index
  else
    @user.save
    session[:user_id] = @user.id
    redirect '/posts'
  end
end
