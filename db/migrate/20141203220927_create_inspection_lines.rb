class CreateInspectionLines < ActiveRecord::Migration
  def change
    create_table :inspection_lines do |t|
      t.integer :inspection_id
      t.integer :line_id

      t.timestamps
    end
  end
end
