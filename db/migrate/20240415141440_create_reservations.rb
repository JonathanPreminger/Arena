class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :number
      t.datetime :date
      t.datetime :time
      t.string :product_type
      t.string :sales_channel
      t.integer :user_id
      t.integer :representation_id

      t.timestamps
    end
  end
end
