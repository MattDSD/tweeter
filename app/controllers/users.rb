get '/' do
  if logged_in?
    erb :"users/homepage"
  else
    erb :"users/signin_signup"
  end
end
