# frozen_string_literal: true
class CreateGiftees < ActiveRecord::Migration[5.0]
  def change
    create_table :giftees do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
