class CompanyAddressesController < ApplicationController

  get '/companies/:id/addresses' do
    erb :"company_addresses/index"
  end

  get '/companies/:id/addresses/new' do
    if logged_in?
      @company = Company.find(params[:id])
      erb :"company_addresses/new"
    else
      redirect "/login"
    end
  end

  post '/companies/:id/addresses' do
    if logged_in?
      @address = CompanyAddress.create(params[:address])
      @address.company = Company.find(params[:id])
      @address.save
      redirect "/companies/#{@address.company.id}/addresses/#{@address.id}"
    else
      redirect "/login"
    end
  end

end
