class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :brief
      t.references :provider
      t.references :category

      t.timestamps
    end
    add_index :products, :provider_id
    add_index :products, :category_id
  end
end
