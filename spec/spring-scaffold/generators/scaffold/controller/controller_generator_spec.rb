require File.expand_path(File.dirname(__FILE__) + "/../../../../spec_helper")

describe ControllerGenerator do

  it "controller template path" do
    expect(described_class.new("category", build_attributes).template_path).to eq "src/templates/controllers"
  end

  context "paths" do
    it "to simple model name" do
      expect(described_class.new("product", build_attributes).path).to eq "/products"
    end

    it "to compound model name" do
      expect(described_class.new("orderItem", build_attributes).path).to eq "/orderItems"
    end
  end
end
