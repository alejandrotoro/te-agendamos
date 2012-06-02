class CreateCategories < ActiveRecord::Migration
  def up
    create_table(:categories) do |t|
      t.string :name
      t.string :description
    end
  end

  def down
    remove_table :categories
  end
end
