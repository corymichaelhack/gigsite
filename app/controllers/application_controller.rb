class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    gigs_path(current_user) #your path
  end
end
