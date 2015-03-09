class DropUserProcedures < ActiveRecord::Migration
  def up
    if table_exists?("user_procesures")
    drop_table :user_procesures 
  end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
