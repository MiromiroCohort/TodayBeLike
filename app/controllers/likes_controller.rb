get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/likes' do
  erb :likes
end

get '/likes/:id' do
	@post_id = params[:id]
	erb :posts
end

put '/likes/:id' do
	@post_id = params[:id]
	@user_id = session[:user_id]
	new_like = Like.new(user_id: @user_id, post_id: @post_id)
	if new_like.valid?
		new_like.save
	end
	posting_user = User.find(Post.find(@post_id).user_id)
	redirect "/profile/#{posting_user.id}"
end


delete '/likes/:id' do
	@post_id = params[:id]
	@user_id = session[:user_id]
	delete_post = Like.where(user_id: @user_id, post_id: @post_id)[0]
	delete_post.destroy
	erb :discover
  # erb :likes
end
