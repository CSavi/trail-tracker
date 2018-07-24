class UsersController < ApplicationController

  # GET: /users
  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/show"
  end

  #GET: signup
  # GET: login
  get '/signup' do
    if !is_logged_in?
      erb :'/users/signup'
    else
      redirect :'/trails'
    end
  end

  #POST: signup
  post '/signup' do
    if params[:username] == "" || params[:password] == "" || params[:email] == ""
      redirect :"/signup"
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect :'/trails'
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
end
