class AddShipcostToShippingOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :shipping_options, :shipcost, :float
  end
end
