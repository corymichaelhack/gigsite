class Admin::GigsController < ApplicationController
  before_action :authenticate_user!

  def new
    @gig = Gig.new
  end

  def create
    # set instance variable to be current user's new gig created with the gig parameters
    @gig = current_user.gigs.create(gig_params)

    # if the gig created is valid
    if @gig.valid?
      redirect_to admin_gig_path(@gig)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @gig = Gig.find(params[:id])
  end

  private

  def gig_params
    params.require(:gig).permit(:title, :description)
  end


end
