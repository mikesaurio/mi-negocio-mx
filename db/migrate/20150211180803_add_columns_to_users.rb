class AddColumnsToUsers < ActiveRecord::Migration

   def up
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
  end

  def down
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
  end
end
