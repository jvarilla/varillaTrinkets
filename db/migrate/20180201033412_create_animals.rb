class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :species
      t.string :kingdom
      t.integer :numlegs

      t.timestamps
    end
  end
end
