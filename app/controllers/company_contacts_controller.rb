class CompanyContactsController < ApplicationController

  get '/companies/:id/contacts' do
    if logged_in?
      erb :"company_contacts/index"
    else
      redirect "/login"
    end
  end

  get '/companies/:id/contacts/new' do

  end

  post '/companies/:id/contacts' do

  end

  

end
