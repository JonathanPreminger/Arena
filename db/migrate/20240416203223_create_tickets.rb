class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :number
      t.float :price
      t.integer :reservation_id

      t.timestamps
    end
  end
end
