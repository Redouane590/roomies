class DashboardsController < ApplicationController

  def profile
    @user = current_user
    @colocations = @user.colocations
  end

  def update_profile_infos
    @user = current_user
    current_user.update(user_params)
    @user.save
    redirect_to profile_path
  end

  def update
    @user = current_user
    @user.update(list_params)
    if @user.save
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :photo, :phone_number)
  end

end
