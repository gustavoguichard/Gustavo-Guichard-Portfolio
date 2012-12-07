class ChangeTypeOfImages < ActiveRecord::Migration
  def change
    execute "TRUNCATE projects CASCADE"
    remove_column :projects, :image_file_name
    remove_column :projects, :image_content_type
    remove_column :projects, :image_file_size
    remove_column :projects, :image_updated_at
    add_column :projects, :image, :oid, :null => false

    execute "TRUNCATE services CASCADE"
    remove_column :services, :image_file_name
    remove_column :services, :image_content_type
    remove_column :services, :image_file_size
    remove_column :services, :image_updated_at
    add_column :services, :image, :oid, :null => false

    execute "TRUNCATE testimonials CASCADE"
    remove_column :testimonials, :avatar_file_name
    remove_column :testimonials, :avatar_content_type
    remove_column :testimonials, :avatar_file_size
    remove_column :testimonials, :avatar_updated_at
    add_column :testimonials, :avatar, :oid, :null => false
  end
end
