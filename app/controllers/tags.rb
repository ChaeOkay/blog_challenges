get '/tag/:name' do
  @posts = Tag.find_by_name(params[:name]).posts
  erb :posts
end
