class AddLineAndTypeToUserFormationStep < ActiveRecord::Migration
  def change
    add_column :user_formation_steps, :line_id, :integer
    add_column :user_formation_steps, :type, :string
  end
end
