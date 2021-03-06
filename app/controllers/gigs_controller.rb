class GigsController < ApplicationController
  before_action :authenticate_user!
  
  def index
      @gigs = current_user.gigs.all
  end

  def show
      @gig = current_user.gigs.find(params[:id])
  end

  def new
    @gig = current_user.gigs.new
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
  end

  def edit  
    @gig = current_user.gigs.find(params[:id])
  end

  def update
    @gig = current_user.gigs.find(params[:id])
    
    respond_to do |format|
      if @gig.update(gig_params)
        format.html { redirect_to @gig, notice: 'Gig was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @gig = current_user.gigs.find(params[:id])
    @sites = Site.where(:gig_id => params[:id]).destroy_all
    @gig.destroy
    redirect_to gigs_path(@gig)
  end

  private

  def gig_params
    params.require(:gig).permit(:title, :description)
  end

end
