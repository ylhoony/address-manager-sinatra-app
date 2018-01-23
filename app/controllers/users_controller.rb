class UsersController < ApplicationController

  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect '/companies'
    else
      erb :"users/signup"
    end
  end

  post '/signup' do
    if User.find_by(email: params[:email])
      flash[:message] = "User exists already."
      redirect "/signup"
    end
    @user = User.create(params)
    if @user.id.nil?
      flash[:message] = "Please fill out all fields."
      redirect "/signup"
    else
      redirect '/companies'
    end
  end

  get '/login' do
    if logged_in?
      redirect "/"
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
      redirect "/login"
    end
  end

  get '/users/edit' do
    if logged_in?
      @current_user = current_user
      erb :"users/edit"
    else
      redirect "/login"
    end
  end

  patch '/users' do
    if logged_in?
      @current_user = current_user
      if session[:user_id] == @current_user.email
        @current_user.update(params[:user])
        session[:user_id] = @current_user.email
        redirect "/users"
      else
        flash[:message] = "Please login."
        redirect "/logout"
      end
    else
      redirect "/login"
    end
  end

end
