class ListsController < ApplicationController

  def index
   @lists = List.where(colocation_id: params[:colocation_id])
   @colocation = Colocation.find(params[:colocation_id])
  # @items = Item.where(list_id: params[:id])
  #  =@items = Item.where(colocation: @colocation.lists)
   @item = Item.new
   @list_new = List.new
  end

  def show
    # @list = List.find(params[:id])
    # @items = Item.where(list_id: params[:id])
    # @colocation = Colocation.find(params[:colocation_id])
  end

  def new
    @colocation = Colocation.find(params[:colocation_id])
    @list = List.new

  end

  def create
    @colocation = Colocation.find(params[:colocation_id])
    @list = List.new(list_params)
    @list.colocation = @colocation
    if @list.save
      redirect_to colocation_lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @colocation = Colocation.find(params[:colocation_id])
    @list = List.find(params[:id])
  end

  def update
    @colocation = Colocation.find(params[:colocation_id])
    @list = List.find(params[:id])
    @list.update(list_params)
    if @list.save
      redirect_to colocation_list_path(@colocation, @list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @colocation = Colocation.find(params[:colocation_id])
    @list = List.find(params[:id])
    @list.destroy

    redirect_to colocation_lists_path
  end

    private

  def list_params
    params.require(:list).permit(:title, :colocation_id)
  end
end
