class CompanyAddressesController < ApplicationController

  get '/companies/:id/addresses' do

  end

  get '/companies/:id/addresses/new' do
    if logged_in?
      @company = Company.find(params[:id])
      erb :"company_addresses/new"
    else
      redirect "/login"
    end
  end

end
