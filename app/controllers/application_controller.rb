require './config/environment'

class ApplicationController < Sinatra::Base

  register Sinatra::Flash
  require 'sinatra/flash'

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :home
  end

  helpers do

    def is_logged_in?
      !!session[:user_id]
    end

    def current_user
      # if there is a current user, return that user
      # otherwise, return nil
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

end
