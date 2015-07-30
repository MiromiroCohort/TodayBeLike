get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/users' do
  erb :users
end

get '/users/:id' do
	params[:id]
  # erb :likes
end

delete '/users/:id' do
	params[:id]
  # erb :likes
end

post '/users/' do

  user = User.new params[:user]
  if user.valid?
    user.save
    session[:user_id]
    erb :discover
  else
    erb :user_creation_error

  end
end

delete '/users/' do
  user_id = session[:user_id]
  User.find(user_id).destroy
  erb :index
end