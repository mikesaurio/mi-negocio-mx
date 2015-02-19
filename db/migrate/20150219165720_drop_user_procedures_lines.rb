class DropUserProceduresLines < ActiveRecord::Migration
  def up
    if table_exists?("user_procesure_lines")
      drop_table :user_procesure_lines
    end
  end
end