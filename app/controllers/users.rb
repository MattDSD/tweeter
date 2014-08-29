get '/users/:id/homepage' do
  @user = User.find(params[:id])
  @user_tweets = @user.tweets
  erb :"users/homepage"
end

get '/signin' do
  erb :"users/signin"
end

post '/signin' do
  @user = User.find_by(username: params[:username])
  session[:user_id] = @user.id
  redirect "/"
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
  if logged_in? && page_owner?
    erb :"/users/edit_user"
  else
    redirect '/'
  end
end

post '/users/:id/edit' do
  if logged_in? && page_owner?
    @user = User.find(params[:id])
    @user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      about: params[:about],
      location: params[:location],
      password: params[:password],
      username: params[:username])
    redirect "/"
  else
    redirect '/'
  end

end

get '/users/:id/delete' do
  if logged_in? && page_owner?
    @user = User.find(params[:id])
    session[:user_id] = nil
    @user.delete
    redirect '/'
  else
    redirect '/'
  end
end

get '/users/:id/followers' do
  @user = User.find(params[:id])
    @being_followed = Following.where(following_id: params[:id])
    @followers = []
    @being_followed.each do |following_relationship|
      @followers << User.find(following_relationship.follower_id)
    end
    erb :"users/show_followers"
end

get '/users/:id/following' do
  @user = User.find(params[:id])
    @followed = Following.where(follower_id: params[:id])
    @followings = []
    @followed.each do |following_relationship|
      @followings << User.find(following_relationship.following_id)
    end
    erb :"users/show_followings"
end





