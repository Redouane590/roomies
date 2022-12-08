class ColocationsController < ApplicationController
  def show
    @colocation = Colocation.find(params[:id])
    @user_colocation = UserColocation.new
    # if params[:new_roomate]
    #   new_roomate = User.find_by(email: params[:new_roomate])
    #   if new_roomate
    #     UserColocation.create(colocation_id: @colocation.id, user_id: new_roomate.id)
    #   else

    #   end
    # end
  end

  def index
  end

  def new
    # @user_colocations = UserColocation.new
    @colocation = Colocation.new
  end

  def create
    @colocation = Colocation.new(colocation_params)
    if @colocation.save
      @chatroom = Chatroom.create(colocation_id: @colocation.id)
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

  def deletephoto
    @colocation = Colocation.find(params[:format])
    @colocation.photo.purge
    redirect_to colocation_path(@colocation)
  end
  # Never trust parameters from the scary internet, only allow the white list through.


    private

  def colocation_params
    params.require(:colocation).permit(:name, :photo)
  end
end
