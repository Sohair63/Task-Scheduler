class AddStatusToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :status, :string, limit: 10, null: false

    add_index :tasks, :status
  end
end
