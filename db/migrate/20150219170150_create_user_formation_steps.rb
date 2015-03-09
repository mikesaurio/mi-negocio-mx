class CreateUserFormationSteps < ActiveRecord::Migration
  def change
    create_table :user_formation_steps do |t|
      t.integer :formation_step_id
      t.integer :user_id

      t.timestamps
    end
  end
end
