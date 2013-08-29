get '/' do
  erb :index
end

post '/login' do
  @user = User.find_by_username(params[:username])
  if @user.password != params[:password]
    redirect '/'
  else
    redirect '/posts'
  end
end

post '/signup' do
  if username_taken?(params[:username]) || password_not_confirmed?(params)
  else
    User.create(email: params[:email],
                          username: params[:username],
                          password: params[:password])
  end
  redirect '/'
end
