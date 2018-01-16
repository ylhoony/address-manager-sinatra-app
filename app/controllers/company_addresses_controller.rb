class CompanyAddressesController < ApplicationController

  get '/companies/:id/addresses' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        erb :"company_addresses/index"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  get '/companies/:id/addresses/new' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        erb :"company_addresses/new"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  post '/companies/:id/addresses' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @address = CompanyAddress.create(params[:address])
        @address.save
        redirect "/companies/#{@address.company.id}/addresses/#{@address.id}"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  get '/companies/:id/addresses/:address_id' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        @address = @company.company_addresses.find {|address| address.id.eql?(params[:address_id].to_i)}
        erb :"company_addresses/show"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  get '/companies/:id/addresses/:address_id/edit' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        @address = @company.company_addresses.find {|address| address.id.eql?(params[:address_id].to_i)}
        erb :"company_addresses/edit"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  patch '/companies/:id/addresses/:address_id' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        @address = @company.company_addresses.find {|address| address.id.eql?(params[:address_id].to_i)}
        @address.update(params[:address])
        @address.save
        redirect "/companies/#{@company.id}/addresses/#{@address.id}"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  delete '/companies/:id/addresses/:address_id/delete' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        @address = CompanyAddress.find(params[:address_id])
        @address.delete
        redirect "/companies/#{@company.id}/addresses"
      else
        redirect "/companies"
      end
    else
      redirect "/login"
    end
  end

end
