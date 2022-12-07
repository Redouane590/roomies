class AddNotifToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :unread_messages, :integer, default: 0
  end
end
