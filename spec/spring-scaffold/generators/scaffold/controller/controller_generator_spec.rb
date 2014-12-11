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

  context "generating" do
    before { mock_config_file }
    after { FileUtils.remove_dir("src") }

    context "from a lowercase name" do
      before { described_class.new("product", build_attributes).build }

      it "creates controller" do
        source = File.join(File.dirname(__FILE__), "templates", "ProductsController.java")
        destination = Configuration.main_class_path("controllers", "ProductsController.java")
        exists_and_identical?(source, destination)
      end

      it "creates controller test" do
        test_class = Configuration.test_class_path("controllers", "ProductsControllerTest.java")
        expect(File.exist?(test_class)).to be true
      end
    end

    context "from a uppercase name" do
      before { described_class.new("Product", build_attributes).build }

      it "creates controller" do
        source = File.join(File.dirname(__FILE__), "templates", "ProductsController.java")
        destination = Configuration.main_class_path("controllers", "ProductsController.java")
        exists_and_identical?(source, destination)
      end

      it "creates controller test" do
        test_class = Configuration.test_class_path "controllers", "ProductsControllerTest.java"
        expect(File.exist?(test_class)).to be true
      end
    end
  end
end
