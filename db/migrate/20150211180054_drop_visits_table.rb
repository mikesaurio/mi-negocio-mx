class DropVisitsTable < ActiveRecord::Migration
 def up
    drop_table :visits table_exists?(:visits)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
