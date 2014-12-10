require File.expand_path(File.dirname(__FILE__) + "/../../../../spec_helper")

describe ModelGenerator do

  it "model template path" do
    expect(described_class.new("category", build_attributes).template_path).to eq "src/templates/models"
  end

  context "jpa" do
    before do
      mock_config_file
      described_class.new("product", build_attributes).build
    end

    after { FileUtils.remove_dir("src") }

    it "should create model" do
      source = File.join(File.dirname(__FILE__), "templates", "Product.java")
      destination = Configuration.main_class_path("models", "Product.java")
      exists_and_identical?(source, destination)
    end
  end
end
