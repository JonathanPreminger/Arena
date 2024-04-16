class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :sexe
      t.integer :age
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :address
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end
end
