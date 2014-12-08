class CreateInspectionRequirements < ActiveRecord::Migration
  def change
    create_table :inspection_requirements do |t|
      t.integer :inspection_id
      t.integer :requirement_id

      t.timestamps
    end
  end
end
