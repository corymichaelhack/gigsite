class CreateGigs < ActiveRecord::Migration[5.2]
  def change
    create_table :gigs do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.timestamps
    end
    add_index :gigs, :user_id
  end
end
