class Country < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :iso_2, uniqueness: true
  validates :iso_3, uniqueness: true
  validates :iso_numeric_3, uniqueness: true

  def slug
    self.name.gsub(/[\W\s+]/,"-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find {|country| slug.eql?(country.slug)}
  end

end
