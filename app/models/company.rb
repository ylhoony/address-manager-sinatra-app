class Company < ActiveRecord::Base
  belongs_to :country
  has_many :user_companies
  has_many :users, through: :user_companies

  validates :name, presence: true
end
