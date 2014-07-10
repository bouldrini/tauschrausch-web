class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :follower_mappings do |t|
      t.references :following_user
      t.references :followed_user
      t.boolean :active
      t.timestamps
    end
  end
end
