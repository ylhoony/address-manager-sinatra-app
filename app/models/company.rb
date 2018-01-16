class Company < ActiveRecord::Base
  belongs_to :country
  has_many :user_companies
  has_many :users, through: :user_companies
  has_many :company_addresses
  has_many :company_contacts

  validates :name, presence: true
end
