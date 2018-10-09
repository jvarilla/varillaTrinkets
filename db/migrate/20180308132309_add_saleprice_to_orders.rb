class AddSalepriceToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :saleprice, :float
  end
end
