get '/users/:id/follows/' do
@leader_id=params[:id]
  erb :follows

end

