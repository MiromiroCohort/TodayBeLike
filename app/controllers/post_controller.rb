get '/' do
  # Look in app/views/index.erb
  redirect '/posts' 
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
    :content => params[:content])
  redirect '/posts'
end

delete '/posts' do
  @this_post = Post.find_by(:id => params[:id])
  @this_post.destroy
  redirect '/posts'
end