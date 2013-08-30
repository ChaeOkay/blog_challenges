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
  start_session(@user)
end

post '/signup' do
  @user = User.create(params[:signup])
  start_session(@user)
end
