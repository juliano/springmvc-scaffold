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

    it "creates model" do
      source = File.join(File.dirname(__FILE__), "templates", "Product.java")
      destination = Configuration.main_class_path("models", "Product.java")
      exists_and_identical?(source, destination)
    end

    it "creates model test" do
      test_class = Configuration.test_class_path "models", "ProductTest.java"
      expect(File.exist?(test_class)).to be true
    end
  end

  context "hibernate" do
    let(:config) { {"package" => "app", "orm" => "hibernate"} }
    before do
      allow(YAML).to receive(:load_file).with(Configuration::FILENAME).and_return(config)
      AppGenerator.new("src", ["-o=hibernate"]).configure_hibernate
      FileUtils.chdir("src")
      described_class.new("product", build_attributes).build
      FileUtils.chdir("..")
    end

    after { FileUtils.remove_dir("src") }

    it "maps entity in hibernate.cfg.xml" do
      source = File.join(File.dirname(__FILE__), "templates", "hibernate.cfg.xml")
      destination = File.join("src", Configuration::MAIN_RESOURCES, "hibernate.cfg.xml")
      exists_and_identical?(source, destination)
    end
  end
end
