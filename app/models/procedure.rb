class Procedure < ActiveRecord::Base
  belongs_to :dependency

  has_many :procedure_requirements
  has_many :requirements, through: :procedure_requirements

  has_many :procedure_lines
  has_many :lines, through: :procedure_lines
end
