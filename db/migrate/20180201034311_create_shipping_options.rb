class CreateShippingOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :shipping_options do |t|
      t.string :optionname
      t.string :shipclass
      t.integer :minshiptime
      t.integer :minshiptime
      t.integer :maxshiptime
      t.string :shipprovider

      t.timestamps
    end
  end
end
