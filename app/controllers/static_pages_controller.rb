class StaticPagesController < ApplicationController
	skip_before_filter :protect_admin
	
	def home
		@testimonials = Testimonial.all(:order => "position")
		@projects = Project.limit(12).all(:order => "position")
		@message = Message.new
	end

	def send_mail
		@message = Message.new(params[:message])
		if @message.valid?
			if ContactMailer.contact_email(@message).deliver
				redirect_to root_path, notice: "Message sent."
	    else
	      redirect_to root_path(anchor:"contact"), notice: "Oops. There was an error while sending your message."
	    end
	  else
	  	redirect_to root_path(anchor:"contact"), notice: "Please fill all fields."
	  end
	end
end