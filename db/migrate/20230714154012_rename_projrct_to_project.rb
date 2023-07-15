class RenameProjrctToProject < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :projrct_id
  end
end
