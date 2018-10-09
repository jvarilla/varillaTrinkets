class AddShippingpriceToShippingOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :shipping_options, :shippingprice, :float
  end
end
