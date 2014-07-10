class Signed::TradesController < Signed::ApplicationController
  def create
    requesting_user = User.find(params[:user_id])
    requested_item = TradeItem.find(params[:trade_item_id])
    trade = Trade.new
    trade.trade_item = requested_item
    trade.requesting_user = requesting_user
    trade.requested_user = requested_item.user
    if trade.save
      flash[:notice] = 'success'
      redirect_to user_trade_item_path(requested_item.user, requested_item)
    else
      flash[:alert] = 'error'
      redirect_to user_trade_item_path(requested_item.user, requested_item)
    end
  end

  def destroy
    trade = Trade.find(params[:trade_id])
    trade.aborted_by = current_user
    if trade.cancel
      notification = Notification.new
      notification.sender = current_user
      notification.receiver = trade.requesting_user
      notification.title = t('trade_notifications.abort.notification_title', trade_item: trade.trade_item.title)
      notification.message = t('trade_notifications.abort.notification_message', user: current_user.full_name, trade_item: trade.trade_item.title)
      notification.save
      redirect_to user_notifications_path(current_user, current_user.full_name.parameterize)
    else
      flash[:alert] = t('trade_notifications.abort.already_aborted')
      redirect_to :back
    end
  end

  def update
    @trade = Trade.find(params[:id])
    counter_value = CounterValue.new
    counter_value_items = params[:trade][:counter_value][:trade_items][0].split(',')
    counter_value.trade = @trade
    if counter_value.save
      counter_value_items.each do |cv_item|
        mapping = CounterValueMapping.new
        mapping.counter_value = counter_value
        mapping.trade_item = TradeItem.find(cv_item)
        mapping.save
      end
      notification = Notification.new
      notification.sender = current_user
      notification.receiver = @trade.requested_user
      notification.title = t('trade_notifications.selection.notification_title', user: current_user.full_name)
      notification.message = render_to_string(partial: 'signed/trade_notifications/counter_value_selected',layout: false, locals: {trade: @trade, notification: notification})
      notification.save
      flash[:notice] = 'success'
      redirect_to market_path()
    end
  end

  def select_counter_value
    @trade = Trade.find(params[:trade_id])
    @items = @user.trade_items.available
    @counter_value_selection = true
  end
end
