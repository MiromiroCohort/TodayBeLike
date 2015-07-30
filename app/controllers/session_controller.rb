# NON-GET routes redirect to GET routes

# CREATE
post '/session' do
  user = User.find_by_username(params[:user][:username])

  if user.password == params[:user][:password]
    session[:user_id] = user.id
    redirect "/"
  else
    redirect "/"
  end

end

# DESTROY
delete '/session' do
  session[:user_id] = nil

  redirect '/'
end