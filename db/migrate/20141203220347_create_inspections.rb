class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.string :nombre
      t.string :materia
      t.string :duracion
      t.string :norma
      t.string :antes
      t.string :durante
      t.string :despues
      t.string :sancion

      t.timestamps
    end
  end
end
