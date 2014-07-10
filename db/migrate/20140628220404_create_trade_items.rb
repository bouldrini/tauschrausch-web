class CreateTradeItems < ActiveRecord::Migration
  def change
    create_table(:trade_items) do |t|
      t.references :user
      t.string :title
      t.text   :description
      t.float   :latitude
      t.float   :longitude
      t.timestamps
    end
  end
end
