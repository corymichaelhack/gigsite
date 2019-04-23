class GigsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @gigs = current_user.gigs.all
  end

  def show
    @gig = Gig.find(params[:id])
  end
end
