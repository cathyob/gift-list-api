# frozen_string_literal: true
class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.references :giftee, foreign_key: true
      t.string :title, null: false
      t.string :where
      t.float :price
      t.string :notes
      t.integer :status

      t.timestamps
    end
  end
end
