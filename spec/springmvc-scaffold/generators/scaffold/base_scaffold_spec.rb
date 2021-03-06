require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe BaseScaffold do
  subject { described_class.new("client") }

  context "simple model name" do
    it "knows model class name" do
      expect(subject.class_name).to eq "Client"
    end

    it "knows model test class name" do
      expect(subject.test_class_name).to eq "ClientTest"
    end

    it "knows repository class name" do
      expect(subject.repository_class_name).to eq "Clients"
    end

    it "knows repository name" do
      expect(subject.repository_name).to eq "clients"
    end

    it "knows repository test class name" do
      expect(subject.repository_test_class_name).to eq "ClientsTest"
    end

    it "knows controller class name" do
      expect(subject.controller_class_name).to eq "ClientsController"
    end

    it "knows controller test class name" do
      expect(subject.controller_test_class_name).to eq "ClientsControllerTest"
    end

    it "knows path" do
      expect(subject.base_path).to eq "clients"
    end
  end

  context "compound model name" do
    it "knows class name to 'orderItem'" do
      expect(described_class.new('orderItem').class_name).to eq "OrderItem"
    end

    it "knows class name to 'OrderItem'" do
      expect(described_class.new('OrderItem').class_name).to eq "OrderItem"
    end

    it "knows parameter name to 'OrderItem'" do
      expect(described_class.new("OrderItem").model_parameter_name).to eq "orderItem"
    end

    it "knows parameter name to 'OrderItem'" do
      expect(described_class.new("orderItem").model_parameter_name).to eq "orderItem"
    end

    it "knows path to 'orderItem'" do
      expect(described_class.new("orderItem").base_path).to eq "orderItems"
    end

    it "knows path to 'OrderItem'" do
      expect(described_class.new("OrderItem").base_path).to eq "orderItems"
    end
  end

  it "do not allow duplicate import" do
    base = described_class.new("product", [Attribute.new("created", "date"), Attribute.new("validity", "date")])
    expect(base.imports.one?).to be true
  end
end
