class Signed::ApplicationController < ApplicationController
  protect_from_forgery with: :exception
  before_filter :globalize_user
  layout 'signed_application'
  protected
  def globalize_user
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end
  end
end
