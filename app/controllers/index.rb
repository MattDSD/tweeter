get '/' do
  if logged_in?
    erb :"users/homepage"
  else
    erb :index
  end
end
