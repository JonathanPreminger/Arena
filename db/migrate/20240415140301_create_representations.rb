class CreateRepresentations < ActiveRecord::Migration[7.0]
  def change
    create_table :representations do |t|
      t.string :key
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :show_id

      t.timestamps
    end
  end
end
