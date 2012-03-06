class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :content
      t.string :visit_url
      t.string :img_url
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
