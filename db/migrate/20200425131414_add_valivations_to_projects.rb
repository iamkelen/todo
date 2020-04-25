class AddValivationsToProjects < ActiveRecord::Migration[6.0]
  def up
    change_table :projects do |t|
      t.change :title, :string, null: false, limit: 100
    end
  end

  def down
    change_table :projects do |t|
      t.change :title, :string
    end
  end
end
