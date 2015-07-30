get '/' do
  erb :login
end


post '/sign_up' do
  @username = params[:user_name]
  @email = params[:email]
  @password = params[:password]




end

