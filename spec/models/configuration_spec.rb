require 'spec_helper'

describe ::Configuration do
  before do
    Configuration.create!(name: 'a_config', value: 'a_value')
  end

  describe "validations" do
    it{ should validate_presence_of :name }
    it{ should validate_uniqueness_of :name }
  end

  describe "#get" do
    before do
      Configuration.create!(name: 'other_config', value: 'another_value')
    end

    it "should get config" do
      expect(::Configuration[:a_config]).to eq 'a_value'
    end

    it "should return nil when not founf" do
      expect(::Configuration[:not_found_config]).to be_nil
    end

    it "should return array" do
      expect(::Configuration[:a_config, :other_config]).to eq ['a_value', 'another_value']
    end
  end

end