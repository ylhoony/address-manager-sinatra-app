class User < ActiveRecord::Base
  has_secure_password

  has_many :user_companies
  has_many :companies, through: :user_companies

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
