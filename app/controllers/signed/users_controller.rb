class Signed::UsersController < Signed::ApplicationController
  def show
    @user = User.find(params[:user_id])
  end

  def follow
    user = User.find(params[:user_id])
    status = params[:format]
    case status.to_sym
      when :follow
        mapping = FollowerMapping.new()
        mapping.following_user = current_user
        mapping.followed_user = user
        mapping.active = true
        mapping.save
      when :unfollow
        mapping = current_user.following.where(:followed_user_id => user).first
        mapping.destroy
    end
    redirect_to user_profile_path(user, user.full_name.parameterize)
  end
end
