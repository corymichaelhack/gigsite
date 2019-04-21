class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :site_id
      t.timestamps
    end
    add_index :notes, :site_id
  end
end
