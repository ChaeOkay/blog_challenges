get '/' do
  redirect '/posts' if  logged_in?
  erb :index
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
