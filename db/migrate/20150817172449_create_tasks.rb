class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name,            limit: 30, null: false
      t.string :executable_path, limit: 30, null: false

      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end

    add_index :tasks, :name
  end
end
