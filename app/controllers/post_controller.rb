class Posts < ActiveRecord::Base
  # Remember to create a migration!
end

#prevent user progress if not logged in
before '/post*' do
  redirect '/' unless session[:user_id]
end


get '/posts' do

@posts = []
my_last_post = Post.where(:user_id => session[:user_id])[-1]

#session[:user_id]
followed_users = User.find(8).followed_id
temp_array = []
if followed_users[0] == nil
  #do nothing
else
  followed_users.each do |item|
    temp_array << Post.where(:user_id => session[:user_id])[-1]
  end
end

  @posts = temp_array
  if @posts[-1] == nil then @posts.pop end
  @posts.unshift(my_last_post)
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