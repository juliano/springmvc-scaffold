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

    it "should know repository class name" do
      expect(subject.repository_class_name).to eq "ClientRepository"
    end

    it "should know repository test class name" do
      expect(subject.repository_test_class_name).to eq "ClientRepositoryTest"
    end

    it "should know controller class name" do
      expect(subject.controller_class_name).to eq "ClientController"
    end

    it "should know controller test class name" do
      expect(subject.controller_test_class_name).to eq "ClientControllerTest"
    end
  end
end
