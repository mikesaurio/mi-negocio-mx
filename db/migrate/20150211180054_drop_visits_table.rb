class DropVisitsTable < ActiveRecord::Migration
 def up
        if table_exists?("visits")
    drop_table :visits 
  end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
