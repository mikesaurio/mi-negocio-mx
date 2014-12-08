class CreateProcedureRequirements < ActiveRecord::Migration
  def change
    create_table :procedure_requirements do |t|
      t.integer :procedure_id
      t.integer :requirement_id

      t.timestamps
    end
  end
end
