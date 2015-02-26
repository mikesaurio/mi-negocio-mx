class ChangeStringToText < ActiveRecord::Migration
 def up
  change_column :dependencies, :nombre, :text
  change_column :formation_steps, :name, :text
  change_column :formation_steps, :description, :text
  change_column :formation_steps, :path, :text
  change_column :inspectors, :nombre, :text
  change_column :inspectors, :vigencia, :text
  change_column :inspectors, :materia, :text
  change_column :inspectors, :supervisor, :text
  change_column :inspectors, :contacto, :text
  change_column :inspectors, :foto, :text
  change_column :lines, :nombre, :text
  change_column :lines, :descripcion, :text
  change_column :requirements, :nombre, :text
  change_column :requirements, :descripcion, :text
end
def down
      change_column :dependencies, :nombre, :string
      change_column :formation_steps, :name, :string
      change_column :formation_steps, :description, :string
      change_column :formation_steps, :path, :string
      change_column :inspectors, :nombre, :string
      change_column :inspectors, :vigencia, :string
      change_column :inspectors, :materia, :string
      change_column :inspectors, :supervisor, :string
      change_column :inspectors, :contacto, :string
      change_column :inspectors, :foto, :string
      change_column :lines, :nombre, :string
      change_column :lines, :descripcion, :string
      change_column :requirements, :nombre, :string
      change_column :requirements, :descripcion, :string
    end
end