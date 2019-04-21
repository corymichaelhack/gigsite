class NotesController < ApplicationController
  
  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.create(note_params)
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end

end
