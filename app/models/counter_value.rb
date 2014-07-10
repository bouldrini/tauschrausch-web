class CounterValue < ActiveRecord::Base
  belongs_to :trade
  has_many :counter_value_mappings
  has_many :trade_items, through: :counter_value_mappings
end

