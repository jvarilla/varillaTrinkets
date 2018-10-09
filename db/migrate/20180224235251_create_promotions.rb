class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.string :promotiontitle
      t.text :promotiondescription
      t.string :desturl
      t.string :adimage
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end
end
