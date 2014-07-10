class CounterValueMapping < ActiveRecord::Base
  belongs_to :counter_value
  belongs_to :trade_item
end
