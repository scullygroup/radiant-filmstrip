class Addparentid < ActiveRecord::Migration
  def self.up
    add_column :fsimages, :parent_id, :integer
  end

  def self.down
    remove_column :fsimages, :parent_id
  end
end
