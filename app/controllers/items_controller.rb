class ItemsController < ApplicationController
  def new
    @item = Item.new
    @list = List.find(params[:list_id])
    @colocation = Colocation.find(params[:colocation_id])
  end

  def create
    @list = List.find(params[:list_id])
    @item = Item.new(item_params)
    @item.list = @list
    @colocation = Colocation.find(params[:colocation_id])
    if @item.save
      redirect_to colocation_list_path(@colocation, @list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @colocation = Colocation.find(params[:colocation_id])
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    @colocation = Colocation.find(params[:colocation_id])
    @item.update(item_params)
    if @item.save
      redirect_to colocation_list_path(@colocation, @list)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @list = List.find(params[:list_id])
    @colocation = Colocation.find(params[:colocation_id])
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to colocation_list_path(@colocation, @list)
  end

    private

  def item_params
    params.require(:item).permit(:name, :list_id, :description, :completed, :urgent?)
  end
end
