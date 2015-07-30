get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/likes' do
  erb :likes
end

get '/likes/:id' do
	params[:id]
  # erb :likes
end

post '/likes/:id' do
	params[:id]
  # erb :likes
end

delete '/likes/:id' do
	params[:id]
  # erb :likes
end