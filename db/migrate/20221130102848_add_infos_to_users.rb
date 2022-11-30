class AddInfosToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :phone_number, :integer
    add_column :users, :status, :string
  end
end
