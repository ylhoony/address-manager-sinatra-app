class CompanyContactsController < ApplicationController

  get '/companies/:id/contacts' do
    if logged_in?
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

  get '/companies/:id/contacts/:contact_id' do
    if logged_in?
      @company = Company.find(params[:id])
      @contact = CompanyContact.find(params[:contact_id])
      erb :"company_contacts/show"
    else
      redirect "/login"
    end
  end

  get '/companies/:id/contacts/:contact_id/edit' do
    if logged_in?
      erb :"company_contacts/edit"
    else
      redirect "/login"
    end
  end

end
