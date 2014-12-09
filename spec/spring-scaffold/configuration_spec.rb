require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Configuration do

  it "should configure main source" do
    expect(Configuration::MAIN_SRC).to eq "src/main/java"
  end

  it "should configure main resources" do
    expect(Configuration::MAIN_RESOURCES).to eq "src/main/resources"
  end

  it "should configure webapp" do
    expect(Configuration::WEB_APP).to eq "src/main/webapp"
  end

  it "should configure web-inf" do
    expect(Configuration::WEB_INF).to eq "#{Configuration::WEB_APP}/WEB-INF"
  end

  it "should configure meta-inf" do
    expect(Configuration::META_INF).to eq "#{Configuration::WEB_APP}/META-INF"
  end

  it "should configure test source" do
    expect(Configuration::TEST_SRC).to eq "src/test/java"
  end

  it "should configure test resources" do
    expect(Configuration::TEST_RESOURCES).to eq "src/test/resources"
  end

  it "should configure scaffold properties" do
    expect(Configuration::FILENAME).to eq "#{Configuration::META_INF}/springmvc-scaffold.properties"
  end

  context "load config file" do
    before do
      config = {"template_engine" => "jsp", "package" => "br.com.juliano", "orm" => "jpa", "models_package" => "models", "controllers_package" => "controllers", "repositories_package" => "repositories"}
      allow(YAML).to receive(:load_file).with(Configuration::FILENAME).and_return(config)
    end

    it "knows models package" do
      expect(Configuration.models_package).to eq "models"
    end

    it "should know full models package" do
      expect(Configuration.full_models_package).to eq "br.com.juliano.models"
    end
  end
end
