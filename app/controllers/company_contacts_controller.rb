class CompanyContactsController < ApplicationController

  get '/companies/:id/contacts' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        erb :"company_contacts/index"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  get '/companies/:id/contacts/new' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        erb :"company_contacts/new"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  post '/companies/:id/contacts' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @contact = CompanyContact.create(params[:contact])
        redirect "/companies/#{@contact.company.id}/contacts/#{@contact.id}"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  get '/companies/:id/contacts/:contact_id' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        @contact = CompanyContact.find(params[:contact_id])
        erb :"company_contacts/show"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  get '/companies/:id/contacts/:contact_id/edit' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @company = Company.find(params[:id])
        @contact = CompanyContact.find(params[:contact_id])
        erb :"company_contacts/edit"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

  patch '/companies/:id/contacts/:contact_id' do
    if logged_in?
      if current_user.company_ids.include?(params[:id].to_i)
        @contact = Company.find(params[:id]).company_contacts.find {|contact| contact.id.eql?(params[:contact_id].to_i)}
        @contact.update(params[:contact])
        @contact.save
        redirect "/companies/#{@contact.company.id}/contacts/#{@contact.id}"
      else
        redirect "/"
      end
    else
      redirect "/login"
    end
  end

end
