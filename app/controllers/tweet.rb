get '/users/:id/tweets/new' do
  if logged_in?
    @user = User.find(params[:id])
    erb :"/tweets/new"
  else
    redirect "/signin"
  end
end

post '/users/:id/tweets/new' do
  @user = User.find(params[:id])
  @user.tweets << Tweet.create(content: params[:content])
  redirect "/"
end

# to check specific tweets
get '/users/:id/tweets/:tweet_id' do
  @user = User.find(params[:id])
  @tweet = Tweet.find(params[:tweet_id])
  erb :"tweets/show"
end

get '/users/:id/tweets/:tweet_id/delete' do
  if logged_in?
    @user = User.find(params[:id])
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.destroy
    redirect "/"
  else
    redirect "/signin"
  end
end
