class Category < ActiveRecord::Base
  has_many :schedules
end
