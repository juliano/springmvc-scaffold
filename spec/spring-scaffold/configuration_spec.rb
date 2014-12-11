require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Configuration do

  it "configures main source" do
    expect(Configuration::MAIN_SRC).to eq "src/main/java"
  end

  it "configures main resources" do
    expect(Configuration::MAIN_RESOURCES).to eq "src/main/resources"
  end

  it "configures webapp" do
    expect(Configuration::WEB_APP).to eq "src/main/webapp"
  end

  it "configures web-inf" do
    expect(Configuration::WEB_INF).to eq "#{Configuration::WEB_APP}/WEB-INF"
  end

  it "configures meta-inf" do
    expect(Configuration::META_INF).to eq "#{Configuration::WEB_APP}/META-INF"
  end

  it "configures test source" do
    expect(Configuration::TEST_SRC).to eq "src/test/java"
  end

  it "configures test resources" do
    expect(Configuration::TEST_RESOURCES).to eq "src/test/resources"
  end

  it "configures scaffold properties" do
    expect(Configuration::FILENAME).to eq "#{Configuration::META_INF}/springmvc-scaffold.properties"
  end

  context "load config file" do
    let(:config) { {"template_engine" => "jsp", "package" => "br.com.juliano", "orm" => "jpa", "models_package" => "models", "controllers_package" => "controllers", "repositories_package" => "repositories"} }
    before do
      allow(YAML).to receive(:load_file).with(Configuration::FILENAME).and_return(config)
    end

    it "knows models package" do
      expect(Configuration.models_package).to eq "models"
    end

    it "knows full models package" do
      expect(Configuration.full_models_package).to eq "br.com.juliano.models"
    end

    it "builds main class path with base package" do
      expect(Configuration.main_class_path("models", "Product.java")).to eq "src/main/java/br/com/juliano/models/Product.java"
    end

    it "builds test class path with base package" do
      expect(Configuration.test_class_path("models", "Product.java")).to eq "src/test/java/br/com/juliano/models/Product.java"
    end

    it "knows orm" do
      expect(Configuration.orm).to eq "jpa"
    end

    it "orm is not hibernate" do
      expect(Configuration.hibernate?).to be false
    end
  end
end
