class Inspection < ActiveRecord::Base

  belongs_to :dependency

  has_many :inspection_lines
  has_many :lines, through: :inspection_lines

  has_many :inspection_requirements
  has_many :requirements, through: :inspection_requirements

  def self.search(query)
    where("nombre ILIKE ?", "%#{query}%")
  end
end
