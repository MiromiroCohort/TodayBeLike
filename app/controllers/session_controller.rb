post '/session' do
 user = User.find_by_username(params[:user][:username])
 if user
   if user.password == params[:user][:password]
     session[:user_id] = user.id
     # redirect '/discover'
     redirect '/today'
   else
     "invalid login"
     # redirect "/"
   end
  end
  "invalid login"
end

delete '/session' do
  session[:user_id] = nil

  redirect '/'
end

get '/session' do
  redirect '/discover'
end


get '/today' do
  erb :today
end




