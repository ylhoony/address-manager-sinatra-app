class CountriesController < ApplicationController

  get '/countries' do
    erb :"countries/index"
  end

  get '/countries/new' do
    erb :"countries/new"
  end

  post '/countries' do
    if has_empty_value?(params) || find_by_params(params)
      redirect "/countries/new"
    else
      @country = Country.create(params)
      redirect "/countries"
    end
  end

  get '/countries/:slug/edit' do

  end

  post '/countries/slug' do

  end

  helpers do
    def find_by_params(params)
      params.find do |key, value|
        Country.find_by("#{key.to_s}": value) # Country.find_by(key.to_sym => value)
      end
    end
  end

end
