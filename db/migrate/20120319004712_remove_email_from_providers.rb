class RemoveEmailFromProviders < ActiveRecord::Migration
  def up
    remove_column :providers, :email
  end

  def down
    add_column :providers, :email
  end
end
