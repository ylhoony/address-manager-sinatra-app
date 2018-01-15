class User < ActiveRecord::Base
  has_secure_password

  has_many :user_companies
  has_many :companies, through: :user_companies

  validates :email, uniqueness: true
end
