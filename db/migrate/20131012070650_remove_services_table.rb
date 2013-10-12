class RemoveServicesTable < ActiveRecord::Migration
  def up
    drop_table :services
  end

  def down
    create_table :services do |t|
      t.string :title
      t.text :content
      t.integer :position

      t.timestamps
    end
  end
end
