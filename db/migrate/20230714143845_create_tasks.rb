class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :startAt, :default => (DateTime.now() + 3.hours)
      t.datetime :endAt, :default => (DateTime.now() + 3.hours)
      t.boolean :status
      t.references :projrct, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
