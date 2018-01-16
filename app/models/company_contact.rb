class CompanyContact < ActiveRecord::Base
  belongs_to :company
  has_one :company_address
end
