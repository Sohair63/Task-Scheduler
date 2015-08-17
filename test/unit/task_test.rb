require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "should not save task without necessary fields" do
    task = Task.new
    assert !task.save
  end
end
