class ListsController < ApplicationController

  def index
   @lists = List.where(colocation_id: params[:colocation_id])
  end

  def new
    List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end

    private

  def list_params
    params.require(:list).permit(:title, :colocation_id)
  end
end
