class GigsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @gigs = current_user.gigs.all
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = current_user.gigs.create(gig_params)

    respond_to do |format|
      if @gig.save
        format.html { redirect_to @gig, notice: 'Gig was successfully created.' }
      else
        format.html { render :new }
      end
    end

    # redirect_to gigs_path(@gig)
  end

  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy
    redirect_to gigs_path(@gig)
  end

  private

  def gig_params
    params.require(:gig).permit(:title, :description)
    
  end

end
