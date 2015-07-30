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

post '/likes/:id' do
	@post_id = params[:id]
	@user_id = session[:user_id]
	new_like = Like.new(user_id: @user_id, post_id: @post_id)
	if new_like.valid?
		new_like.save
	end
	erb :index
end


delete '/likes/:id' do
	@post_id = params[:id]
	@user_id = session[:user_id]
	delete_post = Like.where(user_id: @user_id, post_id: @post_id)[0]
	delete_post.destroy
	erb :index
  # erb :likes
end