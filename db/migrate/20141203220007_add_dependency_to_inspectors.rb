class AddDependencyToInspectors < ActiveRecord::Migration
  def change
    add_column :inspectors, :dependency_id, :integer
  end
end
