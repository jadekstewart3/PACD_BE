class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.string :description
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
