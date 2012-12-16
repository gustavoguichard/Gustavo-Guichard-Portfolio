# coding: utf-8
describe Tag do
  before do
    Tag.all.each { |t| t.destroy }
  end
  context "Validations" do
    it { should validate_presence_of :name }
  end
  context "Associations" do
    it { should have_many(:taggings).dependent(:destroy) }
    it { should have_many(:projects).through(:taggings) }
  end
end