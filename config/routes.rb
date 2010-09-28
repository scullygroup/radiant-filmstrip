ActionController::Routing::Routes.draw do |map|
  
  map.connect '/filmstrip', :controller => "filmstrips", :action => "show"     
  map.resources :fsimages
  
  map.with_options(:controller => 'admin/fsimages') do |fsimage|
    fsimage.fsimage_index           'admin/fsimages',             :action => 'index'
    fsimage.fsimage_show            'admin/fsimages/show',    :action => 'show'   
    fsimage.fsimage_new             'admin/fsimages/new',         :action => 'new'
    fsimage.fsimage_create          'admin/fsimages/create',      :action => 'create'
    fsimage.fsimage_edit            'admin/fsimages/edit/:id',    :action => 'edit'
    fsimage.fsimage_update          'admin/fsimages/update/:id',  :action => 'update'   
    fsimage.fsimage_remove          'admin/fsimages/remove/:id',  :action => 'destroy'
    fsimage.fsimage_updatepos       'admin/fsimages/update_positions/:id',  :action => 'update_positions'
  end
end

end