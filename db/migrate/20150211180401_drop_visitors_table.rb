class DropVisitorsTable < ActiveRecord::Migration
 def up
      if table_exists?("visitors")
    drop_table :visitors 
  end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
