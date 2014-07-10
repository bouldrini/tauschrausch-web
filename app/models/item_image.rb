class ItemImage < ActiveRecord::Base
  belongs_to :trade_item, inverse_of: :item_images

  validates_presence_of :image

  mount_uploader :image, ImageUploader
end
