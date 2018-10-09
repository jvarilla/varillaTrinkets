class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :shippingoption_id
      t.date :orderdate
      t.boolean :recipientisuser
      t.string :shipaddress
      t.string :shipcity
      t.string :shipstate
      t.string :shipzip
      t.boolean :usefiledbillinfo
      t.string :billaddress
      t.string :billcity
      t.string :billstate
      t.string :billzip
      t.integer :orderconfirmationnumber
      t.string :cardmerchant

      t.timestamps
    end
  end
end
