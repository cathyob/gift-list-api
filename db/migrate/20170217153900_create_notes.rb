# frozen_string_literal: true
class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.references :giftee, null: false, foreign_key: true
      t.text :favorites
      t.text :sizes
      t.text :general

      t.timestamps
    end
  end
end
