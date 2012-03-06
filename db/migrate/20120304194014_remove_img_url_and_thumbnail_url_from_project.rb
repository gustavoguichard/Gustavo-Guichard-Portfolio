class RemoveImgUrlAndThumbnailUrlFromProject < ActiveRecord::Migration
  def up
    remove_column :projects, :img_url
    remove_column :projects, :thumbnail_url
  end

  def down
    add_column :projects, :thumbnail_url, :string
    add_column :projects, :img_url, :string
  end
end
