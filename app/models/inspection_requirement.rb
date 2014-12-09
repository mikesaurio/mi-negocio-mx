class InspectionRequirement < ActiveRecord::Base

  belongs_to :inspection
  belongs_to :requirement

end
