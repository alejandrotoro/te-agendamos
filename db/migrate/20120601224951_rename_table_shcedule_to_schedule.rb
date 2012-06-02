class RenameTableShceduleToSchedule < ActiveRecord::Migration
  def up
    rename_table :shcedules, :schedules
  end

  def down
  end
end
