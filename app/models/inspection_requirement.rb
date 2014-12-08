class InspectionRequirement < ActiveRecord::Base

  belongs_to :inspections
  belongs_to :requirements

end
