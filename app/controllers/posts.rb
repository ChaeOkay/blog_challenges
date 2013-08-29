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
  @posts = Post.where(id: params[:id])
  erb :post
end

# get '/post/:id/edit' do
# end

put '/post/:id' do
  post = Post.find_by_id(params[:id])
  post.update_attributes(title: params[:title], body: params[:body])
end

delete '/post/:id' do
  Post.find_by_id(params[:id]).destroy
end
