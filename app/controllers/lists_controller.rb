class ListsController < ApplicationController

  def index
   @lists = List.where(colocation_id: params[:colocation_id])
   @colocation = Colocation.find(params[:colocation_id])
  end

  def show
    @list = List.find(params[:id])
    @items = Item.where(list_id: params[:id])

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
      redirect_to colocation_list_path(@colocation, @list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to colocation_list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to colocation_lists_path
  end

    private

  def list_params
    params.require(:list).permit(:title, :colocation_id)
  end
end
