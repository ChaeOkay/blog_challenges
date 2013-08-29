get '/posts' do
  @posts = Post.all
  erb :index
end

# get 'post/new' do
# end

post '/post/new' do
  blog_post = Post.create(title: params[:title], body: params[:body])
  create_tags(params[:tags], blog_post)
end

get '/post/:id' do
  @post = Post.find(params[:id])
  @tags = @post.tags.map {|t| t.name}.join(", ")
  erb :post
end

# get '/post/:id/edit' do
# end

put '/post/:id' do
  post = Post.find_by_id(params[:id])
  post.update_attributes(title: params[:title], body: params[:body])
  redirect '/post/#{params[:id]}'
end

delete '/post/:id' do
  Post.find_by_id(params[:id]).destroy
end
