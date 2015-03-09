class RenameColumnType < ActiveRecord::Migration
 def self.up
    rename_column :user_formation_steps, :type, :tipo
  end

  def self.down
    # rename back if you need
  end
end