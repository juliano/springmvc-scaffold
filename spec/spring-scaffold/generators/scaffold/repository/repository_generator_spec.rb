require File.expand_path(File.dirname(__FILE__) + "/../../../../spec_helper")

describe RepositoryGenerator do

  it "repository template path" do
    expect(described_class.new("category", build_attributes).template_path).to eq "src/templates/repositories"
  end

  context 'jpa' do
    before do
      mock_config_file
      described_class.new("product", build_attributes).build
    end

    after { FileUtils.remove_dir("src") }

    it "creates repository" do
      source = File.join(File.dirname(__FILE__), "templates", "Products.java")
      destination = Configuration.main_class_path("repositories", "Products.java")
      exists_and_identical?(source, destination)
    end

    it "creates repository test" do
      test_class = Configuration.test_class_path("repositories", "ProductsTest.java")
      expect(File.exist?(test_class)).to be true
    end
  end
end
