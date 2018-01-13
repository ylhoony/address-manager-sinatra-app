class UsersController < ApplicationController

  get '/signup' do
    erb :"users/signup"
  end

  post '/signup' do
    if params.any? {|key, value| value.empty?}
      redirect "/signup"
    else
      @user = User.create(params)
      redirect '/'
    end
  end

  get '/login' do
    erb :"users/login"
  end

  post '/login' do

  end

  get '/users' do

  end
end
