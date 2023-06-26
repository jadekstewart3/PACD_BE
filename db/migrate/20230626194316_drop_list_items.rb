class DropListItems < ActiveRecord::Migration[7.0]
  def change
    drop_table :list_items do |t|
      t.references :item_id
      t.references :list_id
    end
  end
end
