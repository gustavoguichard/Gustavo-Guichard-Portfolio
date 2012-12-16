# coding: utf-8
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
    it { should have_many(:tags).through(:taggings) }
    it { should have_many(:taggings).dependent(:destroy) }
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

  context "Video" do
    subject(:project) { Project.make!(video_url: "https://vimeo.com/41615428") }
    it "#video_number Should extract video number from Vimeo url" do
      project.video_number.to_s.should be == "41615428"
    end
    it "Should validate video url with regex" do
      project.video_url = ""
      project.should be_valid
      project.should be_valid
      project.video_url = "http://vimeo.com/41615428/"
      project.should be_valid
      project.video_url = "vimeo.com/41615428/"
      project.should be_valid
      project.video_url = "http://vimeo.com/"
      project.should_not be_valid
      project.video_url = "http://google.com/08129"
      project.should_not be_valid
      project.video_url = "vimeo.com/4161as5428/"
      project.should_not be_valid
    end
  end

  context "Friendly_id" do
    subject(:project) { Project.make! }
    it "Should match project title" do
      project.friendly_id.should == project.title.parameterize
    end
  end

  context "Taggings" do
    subject(:project) { Project.make! }
    before do
      # tag = Tag.find_or_create_by_name(name: t)
      project.tag_names = "One, Two, Tag Three"
      project.save!
    end
    it "#all_tags Should return tag names separed by spaces" do
      project.all_tags.should match /three/
      project.all_tags.should match /two/
      project.all_tags.should match /one/
    end
    it "#tag_names Should return pretty tag names separed by commas" do
      project.tag_names.should match /One/
      project.tag_names.should match /Two/
      project.tag_names.should match /Tag Three/
      project.tag_names.match(/(\w\,)+/).size.should == 2
    end
    it "#destroy_empty_tags when project is saved" do
      Tag.all.size.should > 2
      project.tag_names = "One, Two"
      project.save!
      Tag.all.size.should == 2
    end
    it "#destroy_empty_tags when project is destroyed" do
      project.tag_names = "One, Two, Tag Three"
      project.save!
      project.destroy
      Tag.all.size.should == 0
    end
  end

  context "#self.search" do
    subject(:project) { Project.make! }
    it "Should find Mineo when there is a project named Mineo" do
      search = Project.search("mineo")
      search.should == []
      project.title = "Mineo"
      project.save!
      search = Project.search("Mineo")
      search.size.should > 0
    end
  end

  context "#thumbnail" do
    subject(:project) { Project.make! }
    it "Should return the image when there's no thumb set" do
      project.thumbnail.should == project.image
    end
    it "Should return the thumb when there's a thumb set" do
      project.thumb = File.open(File.join(Rails.root, "spec/support/images/festival.png"))
      project.thumbnail.should == project.thumb
    end
  end

end