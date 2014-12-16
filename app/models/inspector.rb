class Inspector < ActiveRecord::Base

belongs_to :dependency

  def self.search(query)
    where("nombre like ?", "%#{query}%")
  end
end
