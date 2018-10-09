class CreateEmailMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :email_messages do |t|
      t.string :page_id
      t.string :integer
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
