class GigsController < ApplicationController
  before_action :authenticate_user!
  def index
    @gigs = Gig.all
  end

  def show
    @gig = Gig.find(params[:id])
  end
end
