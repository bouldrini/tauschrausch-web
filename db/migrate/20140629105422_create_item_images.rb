class CreateItemImages < ActiveRecord::Migration
  def change
    create_table :item_images do |t|
      t.references :trade_item
      t.string :image
      t.timestamps
    end
  end
end
