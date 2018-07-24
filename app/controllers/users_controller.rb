class UsersController < ApplicationController

  # GET: /users
  # get "/users/:slug" do
  #   @user = User.find_by_slug(params[:slug])
  #   erb :"/users/show"
  # end

  #GET: signup
  get '/signup' do
    if is_logged_in?
      redirect :'/users/#{@user.slug}'
    else
      erb :'/users/signup'
    end
  end

  #POST: signup
  post '/signup' do
    if params[:username] == "" || params[:password] == "" || params[:email] == ""
      redirect :signup
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect :'/trails'
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

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
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
