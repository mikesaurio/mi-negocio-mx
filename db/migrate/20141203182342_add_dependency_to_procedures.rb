class AddDependencyToProcedures < ActiveRecord::Migration
  def change
    add_column :procedures, :dependency_id, :integer
  end
end
