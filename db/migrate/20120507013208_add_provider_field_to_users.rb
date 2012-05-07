class AddProviderFieldToUsers < ActiveRecord::Migration
  def up
    add_column :users, :is_provider, :boolean, :default => false
  end
  
  def down
    remove_column :users, :is_provider
  end
end
