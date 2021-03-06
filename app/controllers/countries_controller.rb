class CountriesController < ApplicationController

  use Rack::Flash

  get '/countries' do
    erb :"countries/index"
  end

  get '/countries/new' do
    erb :"countries/new"
  end

  post '/countries' do
    if has_empty_value?(params)
      flash[:message] = "Please fill out all fields with unique value."
      redirect "/countries/new"
    else
      @country = Country.create(params)
      flash[:message] = "Created successfully."
      redirect "/countries"
    end
  end

  get '/countries/:slug/edit' do
    @country = Country.find_by_slug(params[:slug])
    erb :"/countries/edit"
  end

  patch '/countries/:slug' do
    @country = Country.find_by_slug(params[:slug])
    if !has_empty_value?(params[:country])
      @country.update(params[:country])
      redirect "/countries"
    else
      flash[:message] = "Please fill out all fields with unique value."
      redirect "/countries/#{@country.slug}/edit"
    end
  end

  helpers do
    def find_by_params(params) # created for uniqueness validation, but can be done with AR validation
      params.find do |key, value|
        Country.find_by("#{key.to_s}": value) # Country.find_by(key.to_sym => value)
      end
    end
  end
end
