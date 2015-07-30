post '/session' do
 user = User.find_by_username(params[:user][:username])
 if user
   if user.password == params[:user][:password]
     session[:user_id] = user.id
     # redirect '/discover'
     redirect '/today'
   else
     "invalid login"
     # redirect "/"
   end
   "invalid login"
  end
  "invalid login"
end

delete '/session' do
  session[:user_id] = nil

  redirect '/'
end

get '/session' do
  redirect '/discover'
end


get '/today' do
  erb :today
end



get '/discover' do
  user = session[:user_id]
  followed_users = User.find(user).followed_id
  all_accounts = User.all
  unfollowed_users = all_accounts - followed_users
  @unfollowed_users_posts = []
  unfollowed_users.each do |user|
    @unfollowed_users_posts << user.posts
  end
  @unfollowed_users_posts.flatten!
  # @unfollowed_users_posts.first.content
   # print "@unfollowed_users_posts.first.content"
  erb :discover
end
