class SitesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @gig = current_user.gigs.find(params[:gig_id])
    @site = Site.new  
  end

  def create
    @gig = current_user.gigs.find(params[:gig_id])
    @site = @gig.sites.create(site_params)
    redirect_to gig_path(@gig)
  end

  def index

  end

  def show
    @gig = current_user.gigs.find(params[:gig_id])
    @site = @gig.sites.find(params[:id])
  end

  def destroy
    @gig = current_user.gigs.find(params[:gig_id])
    @site = @gig.sites.find(params[:id]) 
    @site.destroy
    redirect_to root_path
  end

  def edit  
    @gig = current_user.gigs.find(params[:gig_id])
    @site = @gig.sites.find(params[:id]) 
  end

  def update
    @gig = current_user.gigs.find(params[:gig_id])
    @site = @gig.sites.find(params[:id]) 
    
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to gig_path(@gig), notice: 'Site was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private 

  def site_params
    params.require(:site).permit(:name, :street, :city, :state, :zipcode)    
  end

end