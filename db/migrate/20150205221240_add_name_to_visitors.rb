class AddNameToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :name, :string
  end
end
