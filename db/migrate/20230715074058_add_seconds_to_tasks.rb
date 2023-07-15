class AddSecondsToTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :seconds
    add_column :tasks, :seconds, :integer, :default => 0
  end
end
