require 'spec_helper'
describe TestimonialsController do
  describe "GET #index" do
    context "without testimonials" do
      before do
        get :index
      end
      its(:status) { should == 200 }
    end
    context "with testimonials" do
      before do
        3.times { 
          t = Testimonial.make!
          t.save!
        }
        get :index
      end
      its(:status) { should == 200 }
      it "Should return testimonials body" do
        assigns(:testimonials).size.should == 3
        assigns(:testimonials).should include(Testimonial.last)
        assigns(:testimonials).should include(Testimonial.first)
      end
    end
  end

end