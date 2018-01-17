class CompanyAddress < ActiveRecord::Base
  belongs_to :company
  belongs_to :country
  belongs_to :company_contact

  validates :name, presence: true
end
