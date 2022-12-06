class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def calendar
  end

  def contacts
    @colocation = Colocation.find(params[:colocation_id])
  end
end
