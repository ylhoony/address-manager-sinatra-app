class CompaniesController < ApplicationController

  get '/companies' do
    if logged_in?
      @current_user = current_user
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
      @company = Company.create(params[:company])
      @company.users << current_user
      @company.user_companies.find_by(user_id: current_user.id).update(is_owner: true)
      if !params[:address].empty?
        @address = CompanyAddress.create(params[:address])
        @company.company_addresses << @address
      end
      if !params[:contact].empty?
        @contact = CompanyContact.create(params[:contact])
        @company.company_contacts << @contact
        @address.company_contact = @contact unless @address.nil?
        @address.save
      end
      @company.save
      redirect "companies/#{@company.id}"
    else
      redirect "/login"
    end
  end

  get '/companies/:id' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        erb :"companies/show"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  get '/companies/:id/edit' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        erb :"companies/edit"
      else
        redirect "/companies"
      end
    else
      redirect "/login"
    end
  end

  post '/companies/:id' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        @company.update(params)
        @company.save
        redirect "/companies/#{@company.id}"
      else
        redirect "/companies"
      end
    else
      redirect "/login"
    end
  end

end
