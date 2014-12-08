class Requirement < ActiveRecord::Base

  has_many :procedure_requirements
  has_many :procedures, through: :procedure_requirements

  has_many :inspection_requirements
  has_many :inspections, through: :inspection_requirements

end
