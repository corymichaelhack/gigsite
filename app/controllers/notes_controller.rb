class NotesController < ApplicationController
  before_action :authenticate_user!
  # before_action :require_authorized_for_current_site, only: [:create, :new]

  def index
    
  end

  def new
    @site = Site.find(params[:site_id])
    @note = Note.new
  end

  def show
    @site = Site.find(params[:site_id])
    @note = @site.notes.find(params[:id])
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
  end

  def edit  
    @site = Site.find(params[:site_id])
    @note = @site.notes.find(params[:id]) 
  end

  def update
    @gig = Site.find(params[:site_id]).gig_id
    @site = Site.find(params[:site_id])
    @note = @site.notes.find(params[:id]) 
    
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to gig_site_path( @gig, @site ), notice: 'Note was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
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
