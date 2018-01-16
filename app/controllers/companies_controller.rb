class CompaniesController < ApplicationController

  get '/companies' do
    if logged_in?
      @current_user = current_user
      # binding.pry
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
      @company.users << current_user
      # @company.user_companies.find_by(user_id: current_user.id).is_owner = true
      @company.save
      # binding.pry
      redirect "companies/#{@company.id}"
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

  get '/companies/:id/edit' do
    if logged_in?
      @company = Company.find(params[:id])
      erb :"companies/edit"
    else
      redirect "/login"
    end
  end

  post '/companies/:id' do
    if logged_in?
      @company = Company.find(params[:id])
      @company.update(params)
      @company.save
      redirect "/companies/#{@company.id}"
    else
      redirect "/login"
    end
  end

end
