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

  context "compound model name" do
    it "should know class name to 'orderItem'" do
      expect(described_class.new('orderItem').class_name).to eq "OrderItem"
    end

    it "should know class name to 'OrderItem'" do
      expect(described_class.new('OrderItem').class_name).to eq "OrderItem"
    end

    it "should know parameter name to 'OrderItem'" do
      expect(described_class.new("OrderItem").model_parameter_name).to eq "orderItem"
    end

    it "should know parameter name to 'OrderItem'" do
      expect(described_class.new("orderItem").model_parameter_name).to eq "orderItem"
    end
  end
end
