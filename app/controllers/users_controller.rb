class UsersController < ApplicationController

  get '/signup' do
    erb :"users/signup"
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
    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = params[:email]
      redirect '/users'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/users' do
    erb :"users/index"
  end
end
