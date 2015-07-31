require 'faker'

get '/profile' do
  erb :test_profile
end

get '/profile/:id' do
    user_id = params[:id]
    @user_profile = User.find(user_id)
    # email_address = @user_profile.email.downcase.strip
    # gravatar_hash = Digest::MD5(email_address)
    # @user_img_url = "http://www.gravatar.com/avatar/#{gravatar_hash} (3KB)
    @user_img_url = Faker::Avatar.image
    erb :test_profile
end