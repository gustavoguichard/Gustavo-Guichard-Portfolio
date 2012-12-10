class AddThumbToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :thumb, :oid
  end
end
