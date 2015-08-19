class UpdateStatusLimit < ActiveRecord::Migration
  def up
    change_column :tasks, :status, :string, limit: 30
  end

  def down
    change_column :tasks, :status, :string, limit: 10
  end
end
