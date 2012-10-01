class AddPasswordToSiteSettings < ActiveRecord::Migration
  def change
    add_column :site_settings, :password, :string

  end
end
