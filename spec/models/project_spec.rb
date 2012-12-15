# coding: utf-8
require 'spec_helper'
describe Project do
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

  context "Image" do
    subject(:project) { Project.make! }
    its(:image) { should be_kind_of(ProjectUploader) }
    its('image.to_s') { should match /\/project_image\/\d+/ }
  end

  context "Thumb" do
    subject(:project) { Project.make! }
    its(:thumb) { should be_kind_of(ProjectThumbUploader) }
    its('thumb.to_s') { should match /\/project_thumb\/\d+/ }
  end

    
end