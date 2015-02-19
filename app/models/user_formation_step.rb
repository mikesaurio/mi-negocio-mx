class UserFormationStep < ActiveRecord::Base
  belongs_to :user
  belongs_to :formation_step
end
