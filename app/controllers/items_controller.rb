class ItemsController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @colocation = Colocation.find(params[:colocation_id])
    @list = List.find(params[:list_id])
    @item = Item.new(item_params)
    @item.colocation = @colocation
    @item.list = @list
    if @item.save
      redirect_to colocation_list_path(@colocation, @list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:id])
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to list_path(@list)
  end

  def destroy
    @item = item.find(params[:id])
    @item.destroy

    redirect_to items_path
  end

    private

  def item_params
    params.require(:item).permit(:name, :list_id, :description, :completed?, :urgent?)
  end
end
