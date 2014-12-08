class AddDependencyToInspections < ActiveRecord::Migration
  def change
    add_column :inspections, :dependency_id, :integer
  end
end
