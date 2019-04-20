class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :sites_id
      t.timestamps
    end
    add_index :notes, :sites_id
  end
end
