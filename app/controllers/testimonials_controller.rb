class TestimonialsController < ApplicationController
  def index
    @testimonials = Testimonial.all(:order => "position")
  end

  def show
    @testimonial = Testimonial.find(params[:id])
  end

  def new
    @testimonial = Testimonial.new
  end

  def edit
    @testimonial = Testimonial.find(params[:id])
    redirect_to @testimonial
  end

  def create
    @testimonial = Testimonial.new(params[:testimonial])
    if @testimonial.save
      redirect_to @testimonial, :notice => 'Testimonial was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @testimonial = Testimonial.find(params[:id])
    if @testimonial.update_attributes(params[:testimonial])
      redirect_to @testimonial, :notice => 'Testimonial was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy
    redirect_to testimonials_url
  end

  def sort
    params[:testimonials].each_with_index do |testimonial, index|
      Testimonial.update_all(['position=?', index+1], ['id=?', testimonial[1]["id"]])
    end
    render :nothing => true
  end
end
