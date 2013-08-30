get '/' do
  if current_user && logged_in?
    redirect '/posts'
  else
    erb :index
  end
end

post '/login' do
  @user = User.find_by_username(params[:username]) || User.new
  @user.authenticate(params[:password])

  if @user.errors?
    erb :index
  else
    session[:user_id] = @user.id
    redirect '/posts'
  end
end

post '/signup' do
  @user = User.new(email: params[:email],
                          username: params[:username],
                          password: params[:password])
  @user.authenticate_new_user(params)

  if @user.errors?
    erb :index
  else
    @user.save
    session[:user_id] = @user.id
    redirect '/posts'
  end
end
