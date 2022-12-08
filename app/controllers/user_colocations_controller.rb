class UserColocationsController < ApplicationController
  def show
    @colocation = Colocation.find(params[:id])
  end

  def index
  end

  def new
    @user_colocation = UserColocation.new
    @colocation = Colocation.find(params[:id])
  end

  def create

      @user = User.find_by(email: params[:user_colocation][:user])
      @colocation = Colocation.find(params[:colocation_id])
      if @user
        @user_colocation = UserColocation.new(user_id: @user.id, colocation_id: @colocation.id)
        if @user_colocation.save
          p "j'ai ajouté un colloc"
        end
      end
      redirect_to colocation_path(@colocation)

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
