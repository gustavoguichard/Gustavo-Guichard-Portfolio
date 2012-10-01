class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.text :content
      t.integer :position

      t.timestamps
    end
  end
end
