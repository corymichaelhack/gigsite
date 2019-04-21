class Admin::NotesController < ApplicationController
  def new
    @site = Site.find(params[:site_id])
    @note = Note.new
  end

  def create
    @site = Site.find(params[:site_id])
    @note = @site.notes.create(note_params)
    redirect_to admin_gig_path(@site.gig)
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
