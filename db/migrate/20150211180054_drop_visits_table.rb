class DropVisitsTable < ActiveRecord::Migration
 def up
    drop_table :visits
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
