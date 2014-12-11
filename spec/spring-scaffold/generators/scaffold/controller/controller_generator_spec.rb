require File.expand_path(File.dirname(__FILE__) + "/../../../../spec_helper")

describe ControllerGenerator do

  it "controller template path" do
    expect(described_class.new("category", build_attributes).template_path).to eq "src/templates/controllers"
  end
end
