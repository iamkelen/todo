class AddCompletedToTasks < ActiveRecord::Migration[6.0]
  def up
    add_column :tasks, :completed, :boolean, null: false, default: false
    remove_column :tasks, :completed_at
  end

  def down
    add_column :tasks, :completed_at, :datetime
    remove_column :tasks, :completed
  end
end
