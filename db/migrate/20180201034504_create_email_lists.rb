class CreateEmailLists < ActiveRecord::Migration[5.1]
  def change
    create_table :email_lists do |t|
      t.integer :user_id
      t.integer :emailMessage_id
      t.boolean :viewedemail
      t.boolean :clickedemailad

      t.timestamps
    end
  end
end
