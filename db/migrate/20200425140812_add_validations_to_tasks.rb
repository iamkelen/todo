class AddValidationsToTasks < ActiveRecord::Migration[6.0]
  def up
    change_table :tasks do |t|
      t.change :title, :string, null: false, limit: 255
      t.change :date, :date, null: false
    end
  end

  def down
    change_table :tasks do |t|
      t.change :title, :string
      t.change :date, :date
    end
  end
end
