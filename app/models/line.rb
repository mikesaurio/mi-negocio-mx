class Line < ActiveRecord::Base

  has_many :procedure_lines
  has_many :procedures, through: :procedure_lines

  has_many :inspection_lines
  has_many :inspections, through: :inspection_lines

 belongs_to :municipio

end
