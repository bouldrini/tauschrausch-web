class TradeItem < ActiveRecord::Base
  belongs_to :user
  has_many :item_images, inverse_of: :trade_item, dependent: :destroy
  has_many :trades
  has_many :counter_value_mappings, dependent: :destroy

  scope :available, -> {all}

  validates_presence_of :title
  validates_presence_of :description

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    "#{user.zipcode}, #{user.city}, Germany"
  end
end

