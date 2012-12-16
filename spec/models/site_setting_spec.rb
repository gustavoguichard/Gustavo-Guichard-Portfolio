# coding: utf-8
describe SiteSetting do
  before do
    SiteSetting.all.each { |ss| ss.destroy }
    SiteSetting.make!
  end
  context "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :intro_text }
    it { should validate_presence_of :footer_intro }
    it { should validate_presence_of :footer_contact }
    it { should validate_presence_of :contact_info }
  end

  context "#check_if_unique" do
    it { expect { SiteSetting.make! }.to raise_error ActiveRecord::RecordNotSaved }
  end
end