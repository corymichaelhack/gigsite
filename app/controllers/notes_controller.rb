class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_site, only: [:create, :new]

  def index
    
  end

  def new
    @site = Site.find(params[:site_id])
    @note = Note.new
  end

  def create
    @site = Site.find(params[:site_id])

    @note = current_site.notes.create(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to gig_site_path(current_site.gig, current_site), notice: 'Note was successfully created.' }
      else
        format.html { render :new}
      end
    end


    # redirect_to gig_site_path(current_site.gig, current_site)
  end

  private

  def require_authorized_for_current_site
    if current_site.gig.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
  end

  helper_method :current_site
  def current_site
    @current_site ||= Site.find(params[:site_id])
  end



  def note_params
    params.require(:note).permit(:body, :image)
  end
end
