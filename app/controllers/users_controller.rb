class UsersController < ApplicationController


  get '/signup' do
    if is_logged_in?
      redirect :"/users/#{@user.slug}"
    else
      erb :signup
    end
  end


  post '/signup' do
    if params[:username] == "" || params[:password] == "" || params[:email] == ""
      flash[:error] = "You must fill out all fields to sign up."
      redirect :signup
    # elsif User.find_by(username: params[:username])
    #   #flash[:error] = "That username already exits."
    #   redirect :signup
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect :"/users/#{@user.slug}"
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
      flash[:success] = "Welcome back, #{@user.username}!"
      redirect :"/trails/trails"
    else
      flash[:error] = "Invalid username or password. Please try again."
      redirect :login
    end
  end

  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])

    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect :login
  end
end
