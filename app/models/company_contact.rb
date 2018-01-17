class CompanyContact < ActiveRecord::Base
  belongs_to :company
  has_one :company_address

  validates :first_name, presence: true
  validates :last_name, presence: true
end
