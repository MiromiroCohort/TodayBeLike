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

delete '/users	/:id' do
	params[:id]
  # erb :likes
end

post '/users/' do
  user = User.create params[:user]

  # Let's log the user in immediately
  # session[:user_id] = user.id
"dogs"
  # redirect "/notes"
end