post '/session' do
 user = User.find_by_username(params[:user][:username])
 if user
   if user.password == params[:user][:password]
     session[:user_id] = user.id
     redirect '/discover'

   else
     "invalid login"
     # redirect "/"
   end
   "invalid login"
  end
  "invalid login"
end

>>>>>>> 3e9d089b3b175e7646478e602b504cea530a6605
delete '/session' do
  session[:user_id] = nil

  redirect '/'
end

get '/session' do
  erb :discover
end