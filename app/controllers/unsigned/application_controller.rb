class Unsigned::ApplicationController < ApplicationController
  protect_from_forgery with: :exception
  before_filter :remember_me?
  layout 'unsigned_application'

  def remember_me?
    if current_user.present?
      redirect_to user_profile_path(current_user, current_user.full_name.parameterize)
    end
  end
end
