class AddTipoToRequirements < ActiveRecord::Migration
  def change
    add_column :requirements, :tipo, :text
  end
end
