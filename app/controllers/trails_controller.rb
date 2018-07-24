class TrailsController < ApplicationController

  # GET: /trails
  get "/trails" do
    erb :"/trails/index.html"
  end

  # GET: /trails/new
  get "/trails/new" do
    erb :"/trails/new.html"
  end

  # POST: /trails
  post "/trails" do
    redirect "/trails"
  end

  # GET: /trails/5
  get "/trails/:id" do
    erb :"/trails/show.html"
  end

  # GET: /trails/5/edit
  get "/trails/:id/edit" do
    erb :"/trails/edit.html"
  end

  # PATCH: /trails/5
  patch "/trails/:id" do
    redirect "/trails/:id"
  end

  # DELETE: /trails/5/delete
  delete "/trails/:id/delete" do
    redirect "/trails"
  end
end
