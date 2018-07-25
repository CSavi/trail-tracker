class UsersController < ApplicationController

  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    @trails = @user.trails
    erb :'/users/show'
  end

  #GET: signup
  get '/signup' do
    if is_logged_in?
      redirect :"/users/#{@user.slug}"
    else
      erb :signup
    end
  end

  #POST: signup
  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      if @user.valid?
        session[:user_id] = @user.id
        redirect :"/users/#{@user.slug}"
      elsif @user.invalid? && User.find_by(username: params[:username])
      flash[:error] = "That username already exits."
      redirect :signup
      else
        flash[:error] = "You must fill out all fields to sign up."
        redirect :signup
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
      redirect :'/trails'
    else
      redirect :'/signup'
    end
  end



  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  get '/logout' do
    session.clear
    redirect :login
  end
end
