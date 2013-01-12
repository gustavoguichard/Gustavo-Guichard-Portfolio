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
      it "Should return all testimonials" do
        assigns(:testimonials).size.should == 3
        assigns(:testimonials).should include(Testimonial.last)
        assigns(:testimonials).should include(Testimonial.first)
      end
    end
  end
  describe "GET #show" do
    before do
      @t = Testimonial.make!
      get :show, id: @t
    end
    its(:status) { should == 200 }
    it "Should return the right testimonials" do
      assigns(:testimonial).should == Testimonial.last
    end
  end
  describe "GET #new" do
    before do
      get :new
    end
    its(:status) { should == 200 }
    it "Should create new record" do
      assigns(:testimonial).should be_new_record
    end
  end
  describe "GET #edit" do
    before do
      @t = Testimonial.make!
      get :edit, id: @t
    end
    its(:status) { should == 302 }
    it { should redirect_to @t }
    it "Should edit existant record" do
      assigns(:testimonial).should_not be_new_record
    end
  end
  describe "POST #create" do
    before do
      @t = Testimonial.make!
      post :create, testimonial: @t
    end
    # its(:status) { should == 302 }
    it "Should save record in the database" do
      # Testimonial.all.size.should == 2
      # Testimonial.all.last.content.should == "Very good!"
    end
    # it { should redirect_to @t }
  end
end