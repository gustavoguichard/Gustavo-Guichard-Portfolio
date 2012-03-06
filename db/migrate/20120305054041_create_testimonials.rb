class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :company
      t.string :job
      t.string :website
      t.text :content

      t.timestamps
    end
  end
end
