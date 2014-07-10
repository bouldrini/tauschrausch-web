class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references  :receiver
      t.references  :sender
      t.string      :title
      t.text        :message
      t.boolean     :unread, default: true
      t.timestamps
    end
  end
end
