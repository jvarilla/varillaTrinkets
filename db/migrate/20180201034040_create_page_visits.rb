class CreatePageVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :page_visits do |t|
      t.integer :user_id
      t.integer :page_id
      t.date :visitdate

      t.timestamps
    end
  end
end
