get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
  session[:login_error] = nil
  erb :login
end

post '/login' do
  login_user
  if session[:login_error]
    erb :login
  else
    redirect '/'
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  signup_user
  if session[:signup_error]
    erb :signup
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/create' do
  erb :create
end

get '/show' do

  erb :show
end

post '/create' do
  event = create_event
  if request.xhr?
    event
  else
  redirect '/'
  end
end



get '/delete/:event_id' do
  delete_event
  erb :show
end

get '/edit/:event_id' do
  erb :edit
end

post  '/edit/:event_id' do
  update_event
  redirect '/show'
end





