class UsercolocationsController < ApplicationController
  def show
    @colocation = Colocation.find(params[:id])
  end

  def index
  end

  def new
    @user_colocations = UserColocation.new
    @colocation = Colocation.find(etc)
  end

  def create
    # @user = User.where(email: params[:email])
    # @coloc = Coloc.find(params[:id])
    # @colocation = Colocation.new(user_id: @user.id, colocation_id: @coloc.id)
    if @colocation.save
      redirect_to colocation_path(@colocation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @colocation = Colocation.find(params[:id])
  end

  def update
    @colocation = Colocation.find(params[:id])
    if @colocation.update(colocation_params)
      redirect_to colocation_path(@colocation)
    else
      render :new, status: :unprocessable_entity
    end
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def colocation_params
    params.require(:user_colocations).permit(:name)
  end
end
