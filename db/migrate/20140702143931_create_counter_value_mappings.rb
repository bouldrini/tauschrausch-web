class CreateCounterValueMappings < ActiveRecord::Migration
  def change
    create_table :counter_value_mappings do |t|
      t.references :counter_value
      t.references :trade_item
    end
  end
end
