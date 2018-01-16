class Country < ActiveRecord::Base
  has_many :companies
  has_many :company_addresses

  validates :name, uniqueness: true, presence: true
  validates :iso_2, uniqueness: true, presence: true
  validates :iso_3, uniqueness: true, presence: true
  validates :iso_numeric_3, uniqueness: true, presence: true

  def slug
    self.name.gsub(/[\W\s+]/,"-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find {|country| slug.eql?(country.slug)}
  end

end
