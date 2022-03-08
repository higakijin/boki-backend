class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.datetime :purchased_at, null: false
      t.datetime :deadline_at, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :pro, default: false, null: false

      t.timestamps
    end
  end
end
