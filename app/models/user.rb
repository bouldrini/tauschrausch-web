class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :trade_items, dependent: :destroy

  has_many :followers, :class_name => 'FollowerMapping', :foreign_key => 'followed_user_id'
  has_many :following, :class_name => 'FollowerMapping', :foreign_key => 'following_user_id'

  has_many :notifications, :class_name => 'Notification', :foreign_key => 'receiver_id', dependent: :destroy
  has_many :sender_notifications, :class_name => 'Notification', :foreign_key => 'sender_id', dependent: :destroy

  has_many :incoming_trade_requests, :class_name => 'Trade', :foreign_key => 'requested_user_id', dependent: :destroy
  has_many :outgoing_trade_requests, :class_name => 'Trade', :foreign_key => 'requesting_user_id', dependent: :destroy
  has_many :aborted_trades, :class_name => 'Trade', :foreign_key => 'aborted_by_id', dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  GENDER = %w{mr mrs}
  SALUTATION = %w{dr prof}
  ADDITIONAL_ATTRIBUTES = [:firstname, :lastname, :birthday, :gender, :salutation, :city, :image]

  validates_presence_of   :firstname
  validates_presence_of   :lastname
  validates_presence_of   :birthday
  validates_presence_of   :gender
  validates_inclusion_of  :gender, :in => GENDER
  validates_presence_of   :city
  validates_presence_of   :image

  geocoded_by :full_street_address

  after_validation :geocode

  mount_uploader :image, ImageUploader

  def full_street_address
    "#{zipcode}, #{city}, Germany"
  end

  def for_params(key)
    {key => self, name: self.full_name.parameterize}
  end

  def full_name
    "#{firstname} #{lastname}"
  end

  def is_following?(user)
    mapping = self.following.where(:followed_user_id => user)
    mapping.present?
  end

  def is_interested_in?(item)
    self.outgoing_trade_requests.where(status: 'item_selected').map{|rq| rq.trade_item}.include?(item)
  end
end
