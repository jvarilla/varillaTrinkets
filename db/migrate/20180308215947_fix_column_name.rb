class FixColumnName < ActiveRecord::Migration[5.1]
  def change
	rename_column :orders, :shippingoption_id, :shipping_option_id
  end
end
