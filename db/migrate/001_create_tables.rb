class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :fsimages do |t|
      t.integer   :position
      t.integer   :parent_id
      t.integer   :order
      t.string    :fsimage_file_name,    :string
      t.string    :fsimage_content_type, :string
      t.integer   :fsimage_file_size,    :integer
      t.datetime  :fsimage_updated_at,   :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :fsimages
  end
end