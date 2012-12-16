# coding: utf-8
describe Tag do
  context "Validations" do
    it { should validate_presence_of :name }
  end
  context "Associations" do
    it { should have_many(:taggings).dependent(:destroy) }
    it { should have_many(:projects).through(:taggings) }
  end
end