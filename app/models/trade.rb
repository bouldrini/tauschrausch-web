class Trade < ActiveRecord::Base

  belongs_to :trade_item
  belongs_to :requested_user, class_name: 'User'
  belongs_to :requesting_user, class_name: 'User'
  belongs_to :aborted_by, class_name: 'User'
  has_one  :counter_value

  validates_presence_of :trade_item
  validates_presence_of :requested_user
  validates_presence_of :requesting_user

  after_create :notify_requested_user

  state_machine :status, :initial => :item_selected do
    event :counter_selection_done do
      transition [:item_selected] => :counter_value_selected
    end

    event :cancel do
      transition [:item_selected, :counter_value_selected] => :cancelled
    end

    event :accept do
      transition [:counter_value_selected] => :accepted
    end
  end

  def notify_requested_user
    notification = Notification.new
    notification.sender = self.requesting_user
    notification.receiver = self.requested_user
    notification.title = I18n.t('trade_notifications.new_request', user: self.requesting_user.full_name)
    acb = ActionController::Base.new()
    notification.message = acb.render_to_string(partial: 'signed/trade_notifications/new_notification',layout: false, locals: {trade: self, notification: notification})
    notification.save
  end

end
