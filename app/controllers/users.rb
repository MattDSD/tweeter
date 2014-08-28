get '/users/:id/homepage' do
  @user = User.find(params[:id])
  if logged_in?
    erb :"users/homepage"
  else
    redirect '/'
  end
end

get '/signin' do
  erb :"users/signin"
end

post '/signin' do
  @user = User.find_by(username: params[:username])
  session[:user_id] = @user.id
  redirect "/users/#{@user.id}/homepage"
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

get '/users/:id/edit' do
  @user = User.find(params[:id])
  if logged_in?
    erb :"/users/edit_user"
  else
    redirect '/'
  end
end

post '/users/:id/edit' do
  @user = User.find(params[:id])
  @user.update(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    about: params[:about],
    location: params[:location],
    password: params[:password],
    username: params[:username])
  redirect "/users/#{@user.id}/homepage"
end

get '/users/:id/delete' do
  @user = User.find(params[:id])
  session[:user_id] = nil
  @user.delete
  redirect '/'
end






