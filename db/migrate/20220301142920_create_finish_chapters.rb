class CreateFinishChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :finish_chapters do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
