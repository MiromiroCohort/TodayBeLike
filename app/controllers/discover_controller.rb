get '/discover' do
  user = session[:user_id]
  followed_users = User.find(user).user_id
  all_accounts = User.all
  unfollowed_users = all_accounts - followed_users
  @unfollowed_users_posts = []
  unfollowed_users.each do |user|
    if user.posts.length > 0
      @unfollowed_users_posts << user.posts.order(:created_at).last
    end
  end
  @unfollowed_users_posts.flatten!
  erb :discover
end
