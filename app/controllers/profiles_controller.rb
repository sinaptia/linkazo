class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user_by_username, only: [:show]
  before_action :set_current_user, only: %i[edit update]

  def show
    @links = @user.links.active.ordered
  end

  def edit; end

  def update
    if @user.update(profile_params)
      redirect_to settings_path, notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user_by_username
    @user = User.find_by!(username: params[:username])
  end

  def set_current_user
    @user = current_user
  end

  def profile_params
    params.require(:user).permit(:bio, :username, :avatar, :theme_primary_color, :theme_secondary_color,
                                 :theme_font_family)
  end
end
