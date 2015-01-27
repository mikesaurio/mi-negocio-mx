class AddMunicipioIdToRequirement < ActiveRecord::Migration
  def change
    add_column :requirements, :municipio_id, :int
  end
end
