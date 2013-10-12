class RemoveSiteSettingsTable < ActiveRecord::Migration
  def up
    drop_table :site_settings
  end

  def down
    create_table :site_settings do |t|
      t.string :name
      t.text :intro_text
      t.boolean :available
      t.text :footer_intro
      t.text :footer_contact
      t.text :contact_info
      t.text :contact_text

      t.timestamps
    end
  end
end
