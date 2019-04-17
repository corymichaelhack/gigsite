class Admin::GigsController < ApplicationController
  before_action :authenticate_user!
  def new
    @gig = Gig.new
  end

  def create
    @gig = current_user.gigs.create(gig_params)
    redirect_to admin_gig_path(@gig)
  end

  def show
    @gig = Gig.find(params[:id])
  end

  private

  def gig_params
    params.require(:gig).permit(:title, :description)
  end


end
