class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|

    	t.integer :user_id
    	t.integer :listing_id
    	t.datetime :start_date_and_time
    	t.datetime :end_date_and_time
    	t.string :comments

      t.timestamps null: false
    end
  end
end

  
