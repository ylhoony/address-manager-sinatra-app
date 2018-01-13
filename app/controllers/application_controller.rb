class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "this,is,session,secret"

    set :public_folder, "public"
    set :views, "app/views"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(email: session[:user_id])
    end

    def has_empty_value?(params)
      params.any? {|key, value| value.empty?}
    end
  end

end
