
class UsersController < ApplicationController


  get '/signup' do
    if is_logged_in?
      redirect :"/users/#{current_user.slug}"
    else
      erb :signup
    end
  end


  post '/signup' do
    if params[:username] == "" || params[:password] == "" || params[:email] == ""
      erb :signup
    elsif User.find_by(username: params[:username])
      flash[:error] = "That username already exits. Please choose another."
      redirect :signup
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect :"/trails"
    end
  end

  get '/login' do
    if !is_logged_in?
      erb :login
    else
      redirect :'/trails'
    end
  end


  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect :"/users/#{@user.slug}"
    else
      flash[:error] = "Invalid username or password. Please try again or signup below."
      redirect :'/login'
    end
  end

  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    @trails = @user.trails
    erb :'/users/show'
  end

  get '/logout' do
    if is_logged_in?
      session.clear
      flash[:message] = "You're successfully logged out."
      redirect :'/login'
    else
      flash[:message] = "You're successfully logged out."
      redirect :'/'
    end
  end
end
