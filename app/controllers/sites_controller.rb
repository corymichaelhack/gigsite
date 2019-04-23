class SitesController < ApplicationController
  before_action :authenticate_user!
  
  def index

  end

  def show
    @site = Site.find(params[:id])
  end
end
