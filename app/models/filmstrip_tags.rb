module FilmstripTags
  include Radiant::Taggable
  
  ###############################################################################################
  #
  # Not sure any of this needs to be used since filmstrips_controller.rb now serves the pages
  #
  ###############################################################################################
 
  tag 'filmstrips' do |tag|
    tag.expand
  end
  
end