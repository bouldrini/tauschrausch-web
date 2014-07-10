class Signed::NotificationsController < Signed::ApplicationController
  def index
    @notifications = current_user.notifications
  end
  def show
    @notification = Notification.find(params[:id])
    @notification.unread = false
    @notification.save
  end
end
