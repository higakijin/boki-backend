class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :name
      t.references :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
