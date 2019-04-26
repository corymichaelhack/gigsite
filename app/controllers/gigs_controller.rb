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
    @gig = Gig.create(gig_params)
  end

  private

  def gig_params
    params.require(:gig).permit(:title, :description)
    
  end

end
