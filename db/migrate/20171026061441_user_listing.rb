class UserListing < ActiveRecord::Migration[5.0]
  def change
  	 create_table :listings do |t|
      t.integer :rate
      t.string :description
      t.string :gender
      t.string :country
      t.string :city
      t.string :bday
      t.timestamps

  end
end
end
