class AddMunicipioToLines < ActiveRecord::Migration
  def change
    add_column :lines, :municipio_id, :integer
  end
end
