class NotesController < ApplicationController
  def new
    @site = Site.find(params[:site_id])
    @note = Note.new
  end

  def create
    @site = Site.find(params[:site_id])
    @note = @site.notes.create(note_params)
    redirect_to gig_site_path(@site.gig, @site)
  end

  private

  def note_params
    params.require(:note).permit(:body)
    
  end
end
