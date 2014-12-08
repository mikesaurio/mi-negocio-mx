class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
