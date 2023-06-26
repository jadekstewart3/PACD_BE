class CreateUserLists < ActiveRecord::Migration[7.0]
  def change
    create_table :user_lists do |t|
      t.references :list, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :private

      t.timestamps
    end
  end
end
