class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :nombre
      t.string :duracion
      t.string :costo
      t.string :vigencia
      t.string :contacto

      t.timestamps
    end
  end
end
