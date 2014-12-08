class ProcedureRequirement < ActiveRecord::Base

  belongs_to :procedure
  belongs_to :requirement

end
