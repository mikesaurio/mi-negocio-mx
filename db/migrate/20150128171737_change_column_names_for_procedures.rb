class ChangeColumnNamesForProcedures < ActiveRecord::Migration
  def up
    change_column :procedures, :nombre, :text
    change_column :procedures, :duracion, :text
    change_column :procedures, :costo, :text
    change_column :procedures, :vigencia, :text 
      change_column :procedures, :contacto, :text 
  end
  def down
    change_column :procedures,:nombre,:string
    change_column :procedures,:duracion,:string
    change_column :procedures,:costo,:string
    change_column :procedures,:vigencia,:string
    change_column :procedures,:contacto,:string
  end

end
