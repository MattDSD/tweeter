get '/users/:id/tweets/new' do
  @user = User.find(params[:id])
  erb :"/tweets/new"
end

post '/users/:id/tweets/new' do
  @user = User.find(params[:id])
  @user.tweets << Tweet.create(content: params[:content])
  redirect "/users/#{@user.id}/tweets"
end

get '/users/:id/tweets/:tweet_id' do
  @user = User.find(params[:id])
  @tweet = Tweet.find(params[:tweet_id])
  erb :"tweets/show"
end

get '/users/:id/tweets/:tweet_id/delete' do
  @user = User.find(params[:id])
  @tweet = Tweet.find(params[:tweet_id])
  @tweet.destroy
  redirect '/users/:id/homepage'
end

# test Get
get '/users/:id/tweets' do
  @user = User.find(params[:id])
  @tweets = @user.tweets
  erb :"tweets/show"
end
