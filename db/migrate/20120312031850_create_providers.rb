class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.text :brief
      t.string :address
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
