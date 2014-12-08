class CreateProcedureLines < ActiveRecord::Migration
  def change
    create_table :procedure_lines do |t|
      t.integer :procedure_id
      t.integer :line_id

      t.timestamps
    end
  end
end
