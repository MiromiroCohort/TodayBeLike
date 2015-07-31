get '/users/:id/followed_by/' do
@leader_id=params[:id]
  erb :followed

end

#it's not right, but for testing sake(it should be put)
put '/users/:id' do
  @leader_id=params[:id]
  user_id = session[:user_id]
  if user_id && @leader_id
    User.find(@leader_id).followed_id << User.find(user_id)
    @follower_id=@leader_id
     erb :follows
  end

 end
#it's not right, but for testing sake(it should be delete)
delete '/users/:id' do
    leader_id=params[:id]
    leader=User.find(leader_id)
    user_id = session[:user_id]
    if user_id && leader_id
      leader.followed_id.delete(User.find(user_id))
      leader.save
      erb :follows
    end
end

get '/users/:id/follows/' do
@follower_id= session[:user_id]
  erb :follows

end

