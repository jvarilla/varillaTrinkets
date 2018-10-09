class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.text :occasion
      t.boolean :isgift
      t.text :boxmessage
      t.string :tagmessage
      t.string :tagfontcolor
      t.string :tagcolor

      t.timestamps
    end
  end
end
