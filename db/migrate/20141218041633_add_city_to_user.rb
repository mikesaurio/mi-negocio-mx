class AddCityToUser < ActiveRecord::Migration
  def change
    add_reference :users, :municipio, index: true
  end
end
