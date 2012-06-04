class ChangeDataTypeDatetimeToDateSchedule < ActiveRecord::Migration
  def up
    change_column :schedules, :date, :date
    change_column :schedules, :reminder_date, :date
  end

  def down
    change_column :schedules, :date, :datetime
    change_column :schedules, :reminder_date, :datetime
  end
end
