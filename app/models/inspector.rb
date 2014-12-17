class Inspector < ActiveRecord::Base

belongs_to :dependency

  def self.search(query)
    where("nombre ILIKE ?", "%#{query}%")
  end
end
