class Task < ActiveRecord::Base

  attr_accessible :name, :executable_path, :start_time, :end_time

  validates :name,            presence: true
  validates :executable_path, presence: true

end
