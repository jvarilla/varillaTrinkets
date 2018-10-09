class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :page_id
      t.string :integer
      t.integer :animal_id
      t.string :supplier_id
      t.string :integer
      t.string :prodname
      t.string :price
      t.string :length
      t.string :width
      t.string :height
      t.string :mainimg
      t.string :frontimg
      t.string :backimg
      t.string :leftimg
      t.string :rightimg
      t.string :topimg
      t.string :bottomimg
      t.text :description
      t.string :primarycolor
      t.string :secondarycolor
      t.boolean :hasbase
      t.integer :numinstock

      t.timestamps
    end
  end
end
