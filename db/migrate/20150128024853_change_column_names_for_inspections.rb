class ChangeColumnNamesForInspections < ActiveRecord::Migration
  def up
    change_column :inspections, :nombre, :text
    change_column :inspections, :materia, :text
    change_column :inspections, :duracion, :text
  end

  def down
    change_column :inspections, :nombre, :string
    change_column :inspections, :materia, :string
    change_column :inspections, :duracion, :string
  end
end
