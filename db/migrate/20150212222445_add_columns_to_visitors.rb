class AddColumnsToVisitors < ActiveRecord::Migration
def up
     add_column :visits, :encrypted_password, :string
    add_column :visits, :reset_password_token, :string
    add_column :visits, :reset_password_sent_at, :datetime
    add_column :visits, :remember_created_at, :datetime
    add_column :visits, :current_sign_in_at, :datetime
    add_column :visits, :current_sign_in_ip, :inet
    add_column :visits, :last_sign_in_ip, :inet
  end

  def down
     remove_column :visits, :encrypted_password, :string
    remove_column :visits, :reset_password_token, :string
    remove_column :visits, :reset_password_sent_at, :datetime
    remove_column :visits, :remember_created_at, :datetime
  end
end