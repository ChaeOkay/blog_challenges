get '/posts' do
  @posts = Post.all
  erb :posts
end

# get 'post/new' do
# end

post '/post/new' do
  blog_post = Post.create(params[:post])
  create_tags(params[:tags], blog_post)
end

get '/post/:id' do
  @post = Post.find(params[:id])
  @tags = @post.tags.map {|t| t.name}.join(", ")
  erb :post
end

# get '/post/:id/edit' do
# end
require 'pry'

put '/post/:id' do
  binding.pry
  post = Post.find_by_id(params[:id])
  post.update_attributes(params[:edit])
  redirect '/posts'
end

delete '/post/:id' do
  Post.find_by_id(params[:id]).destroy
  redirect '/posts'
end
