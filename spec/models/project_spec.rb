# coding: utf-8
require 'spec_helper'
describe Project do
  let(:project) { Project.make! }

  context "Validations" do
    before do
      3.times { Project.make! }
    end

    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :image }
  end

  context "Associations" do
    it { should have_many :tags }
    it { should have_many :taggings }
  end

  # describe "#body=" do
  #   text = "Uma _simples_ descrição do *projeto*"

  #   let(:project) { Project.make!(:body => text) }

  #   it "Should have the right body" do
  #     project.body.should == "Uma _simples_ descrição do *projeto*"
  #   end

  #   it "Should have the right html_body" do
  #     project.html_body.should == "<p>Uma <em>simples</em> descrição do <strong>projeto</strong></p>"
  #   end

  #   it "Should remove unauthorized script tags" do
  #     project.body = "<script>alert('hello')</script>\nhello"
  #     project.html_body.should == "<p>hello</p>"
  #     project.body.should == "\nhello"
  #   end
  # end

  # describe "#categories=" do
  #   let(:category) { Category.make!(:name => 'foo') }

  #   it "has no categories" do
  #     project.categories.should be_blank
  #   end

  #   it "has the right categories" do
  #     project.categories = [category]
  #     project.save!
  #     project.categories.count == 1
  #     project.categories.first.should be(category)
  #   end
  # end

  # describe "#category_ids=" do
  #   let(:categories) {
  #     ["foo", "bar", "baz"].map { |cat| Category.make!(:name => cat) }
  #   }

  #   it "sets the categories using the IDs" do
  #     project.category_ids = categories.map { |c| c.id }
  #     project.save!
  #     project.categories.count.should == 3
  #     project.categories.should == categories
  #   end
  # end

end