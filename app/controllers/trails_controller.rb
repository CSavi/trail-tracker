
class TrailsController < ApplicationController


  get "/trails" do
    @user = User.find_by_id(session[:user_id])
    if is_logged_in?
      @trails = Trail.all
      erb :"/trails/trails"
    else
      redirect :'/login'
    end
  end


  get "/trails/new" do
    if is_logged_in?
      erb :"/trails/new"
    else
      redirect :'/login'
    end
  end


  post "/trails" do
    if !is_logged_in?
      redirect :'/login'
    elsif params[:name] == "" || params[:location] == ""
      redirect :"/trails/new"
    else
      @trail = Trail.create(name: params[:name], location: params[:location], date: params[:date], distance: params[:distance], notes: params[:notes])
      current_user.trails << @trail
      flash[:success] = "You've created a new trail!"
      redirect "/trails/#{@trail.id}"
    end
  end


  get "/trails/:id" do
    if is_logged_in?
      @user = current_user
      @trail = Trail.find_by_id(params[:id])
      erb :"/trails/show"
    else
      redirect :'/login'
    end
  end


  get "/trails/:id/edit" do
    @trail = Trail.find_by_id(params[:id])
    if is_logged_in? && @trail.user_id == current_user.id
      erb :"/trails/edit"
    else
      redirect :"/trails/#{@trail.id}"
    end
  end


  patch "/trails/:id" do
    @trail = Trail.find_by_id(params[:id])
    if !is_logged_in?
      redirect :'/login'
    elsif trail_user && (params[:name] == "" || params[:location] == "")
        redirect :"/trails/#{@trail.id}/edit"
    else
      @trail.update(name: params[:name], location: params[:location], date: params[:date], distance: params[:distance], notes: params[:notes])
      flash[:success] = "Successfully edited trail"
      redirect "/trails/#{@trail.id}"
    end
  end


  delete "/trails/:id/delete" do
    @trail = Trail.find_by_id(params[:id])
    if is_logged_in?
      @user = current_user
      if @user.trails.include?(@trail)
        @trail.delete
        flash[:message] = "Successfully deleted trail"
        redirect :"/trails"
      else
        redirect :"/trails"
      end  
    end
  end
end
