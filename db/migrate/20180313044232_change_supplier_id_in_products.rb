class ChangeSupplierIdInProducts < ActiveRecord::Migration[5.1]
  def up #run on db:migrate
	change_column :products, :supplier_id, :integer
  end
  def down #run on db:rollback
	change_column :products, :supplier_id, :string
  end
end
