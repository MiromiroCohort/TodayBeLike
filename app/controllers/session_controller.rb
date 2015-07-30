
# CREATE
post '/session' do
  user = User.find_by_username(params[:user][:username])

  if user.password == params[:user][:password]
    session[:user_id] = user.id
    # erb :discover
  else
    "its not working"
    # redirect "/"
  end

end

