class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/users'
    else
      erb :"users/signup"
    end
  end

  post '/signup' do
    if has_empty_value?(params)
      redirect "/signup"
    else
      @user = User.create(params)
      redirect '/users'
    end
  end

  get '/login' do
    if logged_in?
      rediret "/"
    else
      erb :"users/login"
    end
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = params[:email]
      redirect '/users'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
    end
    redirect '/'
  end

  get '/users' do
    erb :"users/index"
  end
end
