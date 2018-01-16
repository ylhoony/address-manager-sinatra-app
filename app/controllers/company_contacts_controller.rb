class CompanyContactsController < ApplicationController

  get '/companies/:id/contacts' do
    if logged_in?
      binding.pry
      @company = Company.find(params[:id])
      erb :"company_contacts/index"
    else
      redirect "/login"
    end
  end

  get '/companies/:id/contacts/new' do
    if logged_in?
      @company = Company.find(params[:id])
      erb :"company_contacts/new"
    else
      redirect "/login"
    end
  end

  post '/companies/:id/contacts' do
    if logged_in?
      @contact = CompanyContact.create(params[:contact])
      redirect "/companies/#{@contact.company.id}/contacts/#{@contact.id}"
    else
      redirect "/login"
    end
  end


end
