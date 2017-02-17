class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.references :giftee, foreign_key: true
      t.string :favorites
      t.string :sizes
      t.string :general

      t.timestamps
    end
  end
end
