class AddIndexToNotes < ActiveRecord::Migration[5.2]
  def change
    add_index :notes, [:user_id, :sites_id]
  end
end
