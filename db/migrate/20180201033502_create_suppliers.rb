class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :suppliername
      t.string :address
      t.string :phone
      t.string :email
      t.text :notes

      t.timestamps
    end
  end
end
