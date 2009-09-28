class Admin::FsimagesController < ApplicationController
  
  def index
    @fsimages = Fsimage.find_by_position

    respond_to do |format|
      format.html
      format.xml  { render :xml => @fsimages }
    end
  end

  def show
    @image = Fsimage.find(params[:id])
  
    respond_to do |format|
      format.html
      format.xml  { render :xml => @image }
    end
  end

  def new
    @image = Fsimage.new
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @image = Fsimage.find(params[:id])
  end
  
  def create
    @fsimage = Fsimage.new(params[:fsimage])
    @fsimages = Fsimage.find_by_position
    
    respond_to do |format|
      if @fsimage.save
        flash[:notice] = 'Filmstrip was successfully created.'
        format.html { redirect_to :back }
      else
        format.html { render :action => "index" }
      end
    end
  end

  def update
    @image = Fsimage.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Filmstrip was successfully updated.'
        format.html { redirect_to(@image) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def update_positions
    @fsimages = Fsimage.find_by_position
    @fsimages.each do |image|
      image.position = params['image-list'].index(image.id.to_s) + 1 
      image.save
    end
    render :nothing => true
  end

  def destroy
    @image = Fsimage.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to :back }
    end
  end
  
end
