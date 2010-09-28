# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class FilmstripExtension < Radiant::Extension
  version "1.1"
  description "A Radiant extension that allows you to create a sliding film strip."
  url "http://www.scullytown.com"
  
  def activate
    
    tab 'Filmstrip' do
      add_item "Images", "/admin/fsimages"
    end
    
    # admin.tabs.add "Filmstrip", "/admin/fsimages", :after => "Layouts", :visibility => [:all]
    Page.send :include, FilmstripTags
    NoCachePage
  end
  
  def deactivate
    # admin.tabs.remove "Filmstrip"
  end
  
end