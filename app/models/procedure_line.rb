class ProcedureLine < ActiveRecord::Base
 
  belongs_to :procedure
  belongs_to :line

end