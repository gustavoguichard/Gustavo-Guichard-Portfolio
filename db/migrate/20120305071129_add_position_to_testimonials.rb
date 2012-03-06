class AddPositionToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :position, :integer

  end
end
