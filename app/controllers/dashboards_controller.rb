class DashboardsController < ApplicationController

  def profile
    @user = current_user
    @colocations = @user.colocations
  end
end
