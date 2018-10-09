class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :url
      t.string :typeofcontent

      t.timestamps
    end
  end
end
