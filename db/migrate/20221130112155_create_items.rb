class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.boolean :completed, default: false
      t.boolean :urgent, default: false
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
