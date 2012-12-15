module TestimonialsHelper
  def company_link(testimonial)
    if testimonial.website.presence
      string = link_to testimonial.company, testimonial.website, target: "_blank"
    else
      string = testimonial.company
    end
    string += testimonial.job.presence ? ' - ' + testimonial.job : ''
  end
end