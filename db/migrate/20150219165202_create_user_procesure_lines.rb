class CreateUserProcesureLines < ActiveRecord::Migration
  def change
    create_table :user_procesure_lines do |t|
      t.integer :procedure_line_id
      t.integer :user_id

      t.timestamps
    end
  end
end
