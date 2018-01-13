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

end
