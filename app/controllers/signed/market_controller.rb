class Signed::MarketController < Signed::ApplicationController
  require 'will_paginate/array'
  def index
    items = current_user.nearbys(Market::RANGE).map(&:trade_items).flatten
    unless params[:page]
      params[:page] = 1
    end
    @items = items.paginate(:page => params[:page], :per_page => 10)
    if request.xhr?
      render json: {partial: render_to_string(partial: 'trade_items', :items => @items, :layout => false)}
    end
  end
end
