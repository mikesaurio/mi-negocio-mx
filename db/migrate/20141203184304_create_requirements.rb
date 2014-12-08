class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
