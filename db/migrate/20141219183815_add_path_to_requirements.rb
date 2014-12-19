class AddPathToRequirements < ActiveRecord::Migration
  def change
    add_column :requirements, :path, :text
  end
end
