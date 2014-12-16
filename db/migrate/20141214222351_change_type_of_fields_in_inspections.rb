class ChangeTypeOfFieldsInInspections < ActiveRecord::Migration
  def up
    change_column :inspections, :antes, :text
    change_column :inspections, :durante, :text
    change_column :inspections, :despues, :text
  end

  def down
    change_column :inspections, :antes, :string
    change_column :inspections, :durante, :string
    change_column :inspections, :despues, :string
  end
end
