class AddHourFieldsToSchedule < ActiveRecord::Migration
  def up
    add_column :schedules, :hour, :time
    add_column :schedules, :reminder_hour, :time
  end
  
  def down
    remove_column :schedules, :hour
    remove_column :schedules, :reminder_hour
  end
  
end
