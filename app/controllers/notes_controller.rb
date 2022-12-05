class NotesController < ApplicationController
  def show
    @note = Note.find(params[:id])
  end

  def index
    @colocation = Colocation.find(params[:colocation_id])
    @notes = Note.where(colocation_id: params[:colocation_id])
    @note = Note.new
  end

  def new
    @colocation = Colocation.find(params[:colocation_id])
    @note = Note.new
  end

  def create
    @colocation = Colocation.find(params[:colocation_id])
    @note = Note.new(note_params)
    @note.colocation = @colocation
    # if @note.save
    #   redirect_to colocation_notes_path
    # else
    #   render :new, status: :unprocessable_entity
    # end



    respond_to do |format|
      if @note.save
        format.html { redirect_to colocation_notes_path }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "notes/new", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  def edit
    @colocation = Colocation.find(params[:colocation_id])
    @note = Note.find(params[:id])

  end

  def update
    # @colocation = Colocation.find(params[:colocation_id])
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note.save
      redirect_to colocation_notes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @colocation = Colocation.find(params[:colocation_id])
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to colocation_notes_path
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
