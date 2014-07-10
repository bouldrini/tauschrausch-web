class Notification < ActiveRecord::Base
  belongs_to :receiver, :class_name => "User"
  belongs_to :sender, :class_name => "User"

  scope :unread, -> {where(unread: true)}

  validates_presence_of :receiver
  validates_presence_of :message
end
