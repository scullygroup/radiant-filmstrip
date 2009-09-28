class Admin::FsimagesController < ApplicationController
  
  def index
    @fsimages = Fsimage.find_by_size

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fsimages }
    end
  end

  def show
    @image = Fsimage.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image }
    end
  end

  def new
    @image = Fsimage.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image }
    end
  end

  def edit
    @image = Fsimage.find(params[:id])
  end
  
  def create
    @fsimage = Fsimage.new(params[:fsimage])
    @fsimages = Fsimage.find_by_size
    
    respond_to do |format|
      if @fsimage.save
        flash[:notice] = 'Fsimage was successfully created.'
        format.html { redirect_to :back }
        format.xml  { render :xml => @fsimage, :status => :created, :location => @fsimage }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @fsimage.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @image = Fsimage.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Fsimage was successfully updated.'
        format.html { redirect_to(@image) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update_positions
    @fsimages = Fsimage.find_by_size
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
      format.xml  { head :ok }
    end
  end
  
end
