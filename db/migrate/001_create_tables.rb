class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :fsimages do |t|
      t.integer   :position
      t.string    :fsimage_file_name
      t.string    :fsimage_content_type
      t.integer   :fsimage_file_size
      t.datetime  :fsimage_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :fsimages
  end
end