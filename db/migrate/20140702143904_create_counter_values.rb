class CreateCounterValues < ActiveRecord::Migration
  def change
    create_table :counter_values do |t|
      t.references :trade
    end
  end
end
