class SitesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @gig = Gig.find(params[:gig_id])
    @site = Site.new  
  end

  def create
    @gig = Gig.find(params[:gig_id])
    @site = @gig.sites.create(site_params)
    redirect_to gig_path(@gig)
  end

  def index

  end

  def show
    @site = Site.find(params[:id])
  end
end
