class ChangePageIdInEmailMessages < ActiveRecord::Migration[5.1]
  def up #run on db:migrate
	change_column :email_messages, :page_id, :integer
  end
  def down #run on db:rollback
	change_column :email_messages, :page_id, :integer
  end
end
