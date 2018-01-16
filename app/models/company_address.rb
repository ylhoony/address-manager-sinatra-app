class CompanyAddress < ActiveRecord::Base
  belongs_to :company
  belongs_to :country
  has_one :company_contact_id
end
