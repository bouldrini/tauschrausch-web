class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.references  :requesting_user
      t.references  :requested_user
      t.references  :trade_item
      t.references  :aborted_by
      t.string      :status
    end
  end
end
