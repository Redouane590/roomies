class NotesController < ApplicationController
  def show
    @note = Note.find(params[:id])
  end

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
    if @note.save
      redirect_to colocation_notes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(colocation_params)
      redirect_to colocation_notes_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  # Never trust parameters from the scary internet, only allow the white list through.

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
