class Country < ActiveRecord::Base

  def slug
    self.name.gsub(/[\W\s+]/,"-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find {|country| slug.eql?(country.slug)}
  end

end
