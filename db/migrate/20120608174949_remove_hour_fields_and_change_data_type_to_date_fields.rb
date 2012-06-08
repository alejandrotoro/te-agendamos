class RemoveHourFieldsAndChangeDataTypeToDateFields < ActiveRecord::Migration
  def up
    remove_column :schedules, :hour
    remove_column :schedules, :reminder_hour
    change_column :schedules, :date, :datetime
    change_column :schedules, :reminder_date, :datetime
  end

  def down
    add_column :schedules, :hour, :time
    add_column :schedules, :reminder_hour, :time
    change_column :schedules, :date, :date
    change_column :schedules, :reminder_date, :date
  end
end
