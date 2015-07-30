class Posts < ActiveRecord::Base
  # Remember to create a migration!
end

#prevent user progress if not logged in
before '/post*' do
  redirect '/' unless session[:user_id]
end


get '/posts' do
  @posts = []
  @posts = Post.all
  erb :posts
end

get '/posts/:id' do
   @this_post = Post.find_by(:id => params[:id])
   erb :post_show
end




get '/posts/:id/edit' do
  @this_post = Post.find_by(:id => params[:id])
  erb :post_edit
end



patch '/posts/:id/edit' do
  @this_post= Post.find(params[:id])
  @this_post.title = params[:title]
  @this_post.content = params[:content]
  @this_post.save
  redirect '/posts'
end


post '/posts' do
  @this_post= Post.create(:title => params[:title], 
    :content => params[:content],
    :user_id => session[:session_id])
  redirect '/posts'
end

delete '/posts' do
  @this_post = Post.find_by(:id => params[:id])
  @this_post.destroy
  redirect '/posts'
end