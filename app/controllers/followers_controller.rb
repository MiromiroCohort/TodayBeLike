get '/users/:id/follows/' do
@leader_id=params[:id]
  erb :follows

end

#it's not right, but for testing sake(it should be put)
put '/users/:id' do
  leader_id=params[:id]
  user_id = session[:user_id]
  if user_id && leader_id
    User.find(leader_id).followed_id << User.find(user_id)
  end
end
#it's not right, but for testing sake(it should be delete)
get '/users/:id' do
    leader_id=params[:id]
    user_id = session[:user_id]
    if user_id && leader_id
      User.find(leader_id).followed_id << User.find(user_id)
    end
end
