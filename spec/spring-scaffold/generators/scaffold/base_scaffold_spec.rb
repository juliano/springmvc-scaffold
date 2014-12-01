require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe BaseScaffold do
  subject { described_class.new("client") }

  context "simple model name" do
    it "should know model class name" do
      expect(subject.class_name).to eq "Client"
    end

    it "should know model test class name" do
      expect(subject.test_class_name).to eq "ClientTest"
    end
  end
end
