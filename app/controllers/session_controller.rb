# NON-GET routes redirect to GET routes

# CREATE
post '/session' do
  user = User.find_by_username(params[:user][:username])

  if user.password == params[:user][:password]
    session[:user_id] = user.id
    erb :discover
  else
    "its not working"
    # redirect "/"
  end

end

# DESTROY
delete '/session' do
  session[:user_id] = nil

  redirect '/'
end

get '/session' do
  erb :discover
end