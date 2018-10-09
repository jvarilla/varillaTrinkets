class RemoveIntegerFromEmailMessages < ActiveRecord::Migration[5.1]
  def change
    remove_column :email_messages, :integer, :string
  end
end
