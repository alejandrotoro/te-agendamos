class ChangeScheduleFieldsName < ActiveRecord::Migration
  def up
    rename_column :schedules, :user, :user_id
    rename_column :schedules, :category, :category_id
  end

  def down
    rename_column :schedules, :user_id, :user
    rename_column :schedules, :category_id, :category
  end
end
