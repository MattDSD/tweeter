get '/' do
  if logged_in?
    @user = current_user
    p @user
    @tweets = @user.tweets
    p @tweets
    erb :"users/homepage"
  else
    erb :index
  end
end
