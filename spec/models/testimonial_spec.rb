# coding: utf-8
describe Testimonial do

  context "Validations" do
    before do
      3.times { Testimonial.make! }
    end

    it { should validate_presence_of :name }
    it { should validate_presence_of :company }
    it { should validate_presence_of :content }
    it { should validate_presence_of :avatar }
  end

  context "#to_param" do
    subject(:testimonial) { Testimonial.make! }
    it "Should concatenate id and title" do
      testimonial.to_param.should == "#{testimonial.id}-#{testimonial.name.parameterize}"
    end
  end

  context "Avatar" do
    subject(:testimonial) { Testimonial.make! }
    its(:avatar) { should be_kind_of(TestimonialUploader) }
    its('avatar.to_s') { should match /\/testimonial_avatar\/\d+/ }
  end

end