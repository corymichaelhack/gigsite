class AddImageToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :image, :text
  end
end
