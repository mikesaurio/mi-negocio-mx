class CreateInspectors < ActiveRecord::Migration
  def change
    create_table :inspectors do |t|
      t.string :nombre
      t.string :vigencia
      t.string :materia
      t.string :supervisor
      t.string :contacto
      t.string :foto

      t.timestamps
    end
  end
end
