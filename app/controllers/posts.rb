get '/posts' do
  @posts = Post.all
  erb :index
end

get 'post/new' do
end

post 'post/new' do
end

get 'post/:id' do
end

get 'post/:id/edit' do
end

put 'post/:id' do
end

delete 'post/:id' do
end
