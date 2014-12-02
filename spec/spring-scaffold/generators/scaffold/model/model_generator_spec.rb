require File.expand_path(File.dirname(__FILE__) + "/../../../../spec_helper")

describe ModelGenerator do

  it "model template path" do
    expect(described_class.new("category", build_attributes).template_path).to eq "src/templates/models"
  end
end
