class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|

    	t.string "driver_name", :limit => 50
    	t.string "driver_email", :limit => 100
    	t.string "driver_phone", :limit => 100
    	t.string "ride_secret"
    	t.datetime "date_leaving"
    	t.string "leaving_from"
    	t.string "going_to"
    	t.integer "seats_in_car"
    	t.text "notes"
    	t.datetime "expiry_date"

      t.timestamps null: false
    end
  end
end
