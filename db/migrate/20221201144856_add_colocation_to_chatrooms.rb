class AddColocationToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :colocation, null: false, foreign_key: true
  end
end
