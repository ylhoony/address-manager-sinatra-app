class CompaniesController < ApplicationController

  get '/companies' do
    erb :"companies/index"
  end

  get '/companies/new' do
    erb :"companies/new"
  end

  post '/companies' do

  end

end
