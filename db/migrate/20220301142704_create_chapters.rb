class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.string :name, null: false
      t.references :level, null: false, foreign_key: true
      t.integer :order, null: false

      t.timestamps
    end
  end
end
