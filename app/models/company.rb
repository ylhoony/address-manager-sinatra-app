class Company < ActiveRecord::Base
  belongs_to :country
  has_many :user_companies
  has_many :users, through: :user_companies
  has_many :company_addresses

  validates :name, presence: true
end
