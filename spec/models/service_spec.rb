# coding: utf-8
describe Service do
  context "Validations" do
    before do
      3.times { Service.make! }
    end

    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :image }
  end

  context "#to_param" do
    subject(:service) { Service.make! }
    it "Should concatenate id and title" do
      service.to_param.should == "#{service.id}-#{service.title.parameterize}"
    end
  end

  context "Image" do
    subject(:service) { Service.make! }
    its(:image) { should be_kind_of(ServiceUploader) }
    its('image.to_s') { should match /\/service_image\/\d+/ }
  end

end