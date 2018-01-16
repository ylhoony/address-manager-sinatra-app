class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/companies'
    else
      erb :"users/signup"
    end
  end

  post '/signup' do
    if has_empty_value?(params)
      redirect "/signup"
    else
      @user = User.create(params)
      redirect '/companies'
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
      redirect '/companies'
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
    if logged_in?
      @current_user = current_user
      erb :"users/show"
    else
      rediret "/login"
    end
  end

  get '/users/edit' do
    if logged_in?
      erb :"users/edit"
    else
      rediret "/login"
    end
  end

end
