class CreateUserColocations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_colocations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :colocation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
