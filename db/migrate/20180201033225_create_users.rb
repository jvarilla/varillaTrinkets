class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.boolean :receiveemail
      t.string :profileimage

      t.timestamps
    end
  end
end
