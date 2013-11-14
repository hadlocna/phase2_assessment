helpers do

def login_user
  @user = User.find_by_email(params[:email])
  if @user
    if @user.password == params[:password]
      #give token
      session[:id] = @user.id
      session[:login_error] = nil
    else
      session[:login_error] = "Email and password combination not found"
    end
  else
    session[:login_error] = "User not found"
  end

# @email = params[:user][:email] @password = params[:user][:password]
# @user = User.authenticate(@email,@password)
# if @user
# session[:user_id] = @user.id erb :show_user
# else
# @error = "Try again" erb :index
# end
end

def logged_in?
  !session[:id].nil?
end

def signup_user
  @user = User.create(first_name: params[:firstname], last_name: params[:lastname], email: params[:email], password_digest: params[:password], birthdate: params[:birthdate])

  if @user.valid?
    session[:id] = @user.id
    session[:signup_error] = nil
  else
    session[:signup_error] = "Sign up failed!  Please try again."
  end
end

end
