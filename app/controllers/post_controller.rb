class Posts < ActiveRecord::Base
  # Remember to create a migration!
end

#prevent user progress if not logged in
before '/post*' do
  redirect '/' unless session[:user_id]
end


get '/posts' do
  @posts = []
  @posts << User.find(session[:user_id]).posts.last
  followed = User.find(session[:user_id]).user_id
  followed.each do |user|
   @posts<< user.posts.last
 end
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
  temp_string = params[:content]
    if temp_string == "" then temp_string = "Nothing to say about Today" end
    if temp_string.length > 150 then temp_string = temp_string[0..150] end  
  @this_post= Post.create(:title => params[:title], 
    :content => temp_string,
    :user_id => session[:user_id])
  redirect '/posts'
end

delete '/posts' do
  @this_post = Post.find_by(:id => params[:id])
  @this_post.destroy
  redirect '/posts'
end