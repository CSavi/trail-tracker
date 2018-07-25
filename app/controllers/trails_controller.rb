class TrailsController < ApplicationController


  get "/trails" do
    @user = User.find_by_id(session[:user_id])
    if is_logged_in?
      @trails = Trail.all
      erb :"/trails/trails"
    else
      redirect :login
    end
  end


  get "/trails/new" do
    if is_logged_in?
      erb :"/trails/new"
    else
      redirect :login
    end
  end


  post "/trails" do
    if !is_logged_in?
      redirect :login
    elsif params[:name] == "" || params[:location] == ""
      redirect :"/trails/new"
    else
      @trail = Trail.create(name: params[:name], location: params[:location], date: params[:date], distance: params[:distance], notes: params[:notes])
      @trail.save
      flash[:success] = "You have created a new trail"
      redirect "/trails/#{@trail.id}"
    end
  end


  get "/trails/:id" do
    if is_logged_in?
      @user = current_user
      @trail = Trail.find_by_id(params[:id])
      erb :"/trails/show"
    else
      redirect :login
    end
  end


  get "/trails/:id/edit" do
    @trail = Trail.find_by_id(params[:id])
      if is_logged_in? && @trail.user_id == current_user.id
        erb :"/trails/edit"
      else
        redirect :login
      end
   end


  patch "/trails/:id" do
    @trail = Trail.find_by_id(params[:id])
    if is_logged_in? && params[:name] == "" || params[:location] == ""
      redirect :"/trails/#{@trails.id}/edit"
    else
      @trail.update(name: params[:name], location: params[:location], date: params[:date], distance: params[:distance], notes: params[:notes])
      @trail.save
      flash[:success] = "Successfully edited trail"
      redirect "/trails/#{@trails.id}"
    end
  end


  delete "/trails/:id/delete" do
    @trail = Trail.find_by_id(params[:id])
    if current_user.id == @trail.id && is_logged_in?
      @trail.delete
      flash[:success] = "Successfully deleted trail"
      redirect :"/trails"
    else
      redirect :"/trails/trails"
    end
  end
end
