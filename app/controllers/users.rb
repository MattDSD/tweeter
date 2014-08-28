get '/signin' do
  erb :"users/signin"
end

post '/signin' do
  @user = User.find_by(username: params[:username])
  session[:user_id] = @user.id
  redirect '/'
end

get '/signup' do
  erb :"users/signup"
end

post '/signup' do
  User.create(params)
  # consider signing the user in after signing up
  redirect '/'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

