class CreateBookingRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_requests do |t|
      t.string :status, default: 'pending'
      t.string :location
      t.datetime :date_from
      t.datetime :date_till
      t.references :rv, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
