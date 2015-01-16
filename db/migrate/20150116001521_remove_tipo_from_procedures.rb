class RemoveTipoFromProcedures < ActiveRecord::Migration
  def change
    remove_column :procedures, :tipo
  end
end
