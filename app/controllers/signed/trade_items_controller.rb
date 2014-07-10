class Signed::TradeItemsController < Signed::ApplicationController
  def new
    @item = TradeItem.new
  end

  def edit
    @item = TradeItem.find(params[:id])
  end

  def create
    images = params[:item_images]
    @item = TradeItem.new(trade_item_params)
    @item.user = User.find(params[:user_id])
    if @item.save
      if images.present?
        images.each do |image|
          obj = ItemImage.new
          obj.image = image
          obj.trade_item = @item
          obj.save
        end
      end
      redirect_to user_item_pool_path(@item.user, @item.user.full_name.parameterize)
    else
      render :new
    end
  end

  def update
    images = params[:item_images]
    item = TradeItem.find(params[:id])
    if item.update(trade_item_params)
      if images.present?
        images.each do |image|
          obj = ItemImage.new
          obj.image = image
          obj.trade_item = item
          obj.save
        end
      end
      redirect_to user_item_pool_path(current_user, current_user.full_name.parameterize)
    else
      render :edit
    end
  end

  def show
    @item = TradeItem.find(params[:id])
  end

  def destroy
    item = TradeItem.find(params[:id])
    item.destroy
    redirect_to user_item_pool_path(current_user, current_user.full_name.parameterize)
  end

  protected

  def trade_item_params
    params.require(:trade_item).permit(:title, :description)
  end
end
