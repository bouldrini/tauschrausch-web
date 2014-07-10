class Signed::ItemPoolController < Signed::ApplicationController
  def index
    @items = @user.trade_items.available
  end
end
