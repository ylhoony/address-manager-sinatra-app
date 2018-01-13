class CountriesController < ApplicationController

  get '/countries' do
    erb :"countries/index"
  end

  get '/countries/new' do
    erb :"countries/new"
  end

  post '/countries' do

  end

  get '/countries/:slug/edit' do

  end

  post '/countries/slug' do

  end

end
