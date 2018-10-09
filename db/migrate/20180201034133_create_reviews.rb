class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :title
      t.text :comment
      t.float :rating
      t.date :postdate

      t.timestamps
    end
  end
end
