class ChangeInspectionColumnsLength < ActiveRecord::Migration
  def up
    change_column :inspections, :norma, :text
    change_column :inspections, :sancion, :text
  end

  def down
    change_column :inspections, :norma, :string
    change_column :inspections, :sancion, :string
  end
end
