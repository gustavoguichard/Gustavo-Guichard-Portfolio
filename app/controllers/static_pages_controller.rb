class StaticPagesController < ApplicationController
	def home
		@testimonials = Testimonial.all(:order => "position")
	end

	def contact
		@message = Message.new
	end

	def send_mail
		@message = Message.new(params[:message])
		if @message.valid?
			if ContactMailer.contact_email(@message).deliver
			  flash[:notice] = "Message sent."
			  redirect_to contact_path
	    else
	      flash[:notice] = "Oops. There was an error while sending your message."
	      render :contact
	    end
	  else
	  	flash[:notice] = "Please fill all fields."
	  	render :contact
	  end
	end
end
