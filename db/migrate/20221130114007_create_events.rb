class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :content
      t.references :colocation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
