class CompaniesController < ApplicationController

  get '/companies' do
    if logged_in?
      erb :"companies/index"
    else
      redirect "/login"
    end
  end

  get '/companies/new' do
    if logged_in?
      erb :"companies/new"
    else
      redirect "/login"
    end
  end

  post '/companies' do
    if logged_in?
      @company = Company.create(params)
      @company.country = Country.find_by(name: params[:country_id])
      @company.save
      redirect "companies/:id"
    else
      redirect "/login"
    end
  end

  get '/companies/:id' do
    if logged_in?
      @company = Company.find(params[:id])
      erb :"companies/show"
    else
      redirect "/login"
    end
  end

end
