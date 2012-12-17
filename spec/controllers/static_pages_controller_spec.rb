require 'spec_helper'
describe StaticPagesController do
  describe "GET #home" do
    context "without testimonials" do
      before do
        get :home
      end
      its(:status) { should == 200 }
    end
    context "with testimonials" do
      before do
        3.times { 
          t = Testimonial.make!
          t.save!
        }
        get :home
      end
      its(:status) { should == 200 }
      it "Should return testimonials body" do
        assigns(:testimonials).size.should == 3
        assigns(:testimonials).should include(Testimonial.last)
        assigns(:testimonials).should include(Testimonial.first)
      end
    end
  end

  describe "GET #contact" do
    context "When just visiting" do
      before do
        get :contact
      end
      its(:status) { should == 200 }
      it "Should initialize new Message" do
        assigns(:message).should be_kind_of(Message)
        assigns(:message).name.should be_blank
      end
    end
  end

  describe "POST #send_mail" do
    context "When fails to send message" do
      before do
        post :send_mail,
          message: {name: "Hey",
                    email: "",
                    body: ""}
      end
      its(:status) { should == 200 }
      it { should render_template :contact }
      it "Flash notice should warn user" do
        flash.should_not be_nil
      end
      it "Message should not be a new record" do
        assigns[:message].name.should == "Hey"
        assigns[:message].email.should be_blank
      end
    end
    context "When message is sent" do
      before do
        post :send_mail, 
          message: {name: Faker::Name.name,
                    email: Faker::Internet.email,
                    body: Faker::Lorem.words}
      end
      its(:status) {should == 302}
      it { should redirect_to contact_path }
      it "Flash should not be nil" do
        flash.should_not be_nil
      end
      it "Message should be in the sent list" do
        ActionMailer::Base.deliveries.first.should_not be_nil
      end
    end
  end
end