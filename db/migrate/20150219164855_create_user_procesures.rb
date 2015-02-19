class CreateUserProcesures < ActiveRecord::Migration
  def change
    create_table :user_procesures do |t|
      t.integer :procedure_id
      t.integer :user_id

      t.timestamps
    end
  end
end
