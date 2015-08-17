class Task < ActiveRecord::Base

  attr_accessible :name, :executable_path, :start_time, :end_time

end
