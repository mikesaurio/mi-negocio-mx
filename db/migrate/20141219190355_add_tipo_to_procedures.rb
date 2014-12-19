class AddTipoToProcedures < ActiveRecord::Migration
  def change
    add_column :procedures, :tipo, :text
  end
end
