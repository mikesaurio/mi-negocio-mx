class AddMunicipioToDependency < ActiveRecord::Migration
  def change
    add_reference :dependencies, :municipio, index: true
  end
end
