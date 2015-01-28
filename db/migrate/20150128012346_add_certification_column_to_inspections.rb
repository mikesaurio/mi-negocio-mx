class AddCertificationColumnToInspections < ActiveRecord::Migration
  def change
    add_column :inspections, :certification, :text
  end
end
