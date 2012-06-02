class CreateSchedules < ActiveRecord::Migration
  def up
    create_table(:shcedules) do |t|
      t.string :title
      t.integer :user
      t.datetime :date
      t.datetime :reminder_date
      t.string :periodicity, :default => 'None'
      t.string :description
      t.integer :category
    end
  end

  def down
    remove_table :shcedules
  end
end
