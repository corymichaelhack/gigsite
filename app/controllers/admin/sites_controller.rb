class Admin::SitesController < ApplicationController
  
  def new
    @gig = Gig.find(params[:gig_id])
    @site = Site.new  
  end

  def create
    @gig = Gig.find(params[:gig_id])
    @site = @gig.sites.create(site_params)
    redirect_to admin_gig_path(@gig)
  end

  def show
    
  end

  private

  def site_params
    params.require(:site).permit(:name, :street, :city, :state, :zipcode)
  end

end
