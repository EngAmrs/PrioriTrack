class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false,
      t.datetime :startAt
      t.datetime :endAt
      t.boolean :status, :default => 0
      t.references :projrct, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tasks, :name, unique: true
  end
end
