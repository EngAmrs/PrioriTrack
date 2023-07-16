class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :client
      t.boolean :visibility
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
