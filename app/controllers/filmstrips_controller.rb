class FilmstripsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :route_not_found
  
  no_login_required
  #radiant_layout 'Slideshow'
  
  def index
    @fsimages = Fsimage.find_by_size
    render :layout => false
  end
  
  def show
    @fsimages = Fsimage.find_by_size
    
    respond_to do |format|
      format.xml
    end
  end

  def edit
    @fsimages = Fsimage.find_by_size
  end

  private
  
  def route_not_found
    render :text => '', :status => :not_found
    #redirect_to '/'
  end
  
end
