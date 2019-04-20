class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :gig_id
      t.timestamps
    end
    add_index :sites, :gig_id
  end
end
