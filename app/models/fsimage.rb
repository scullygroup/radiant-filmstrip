class Fsimage < ActiveRecord::Base
  
  has_attachment   :content_type => :image, 
                   :storage => :file_system,
                   :path_prefix => 'public/filmstrips', 
                   :max_size => 500.kilobytes,
                   :resize_to => '3000x290>',
                   :thumbnails => { :thumb => '100x100>', :tom => '100x100>', :steve => '100x100>' }

  validates_as_attachment
  
  def self.find_by_size
    find(:all, :order => "position", :conditions => ['thumbnail IS NULL'])
  end

end