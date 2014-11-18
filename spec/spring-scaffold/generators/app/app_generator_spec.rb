require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe AppGenerator do

  context "build new application" do
    let(:project_path) { "src/springmvc-scaffold" }

    before do
      described_class.new(project_path, []).invoke_all
    end

    after do
      FileUtils.remove_dir("src")
    end

    it "should create directory with project name" do
      expect(File.exist?(project_path)).to be true
    end

    it "should be invalid when project name already exist" do
      expect(Kernel).to receive(:exit)
      described_class.new(project_path, [])
    end

    it "should create pom.xml" do
      source = File.join(File.dirname(__FILE__), "templates", "pom.xml")
      destination = "#{project_path}/pom.xml"
      exists_and_identical?(source, destination)
    end

    context "creating main java" do
      let(:main_java) { "#{project_path}/#{Configuration::MAIN_SRC}" }
      let(:app) { "#{main_java}/app" }

      it "should create source folder" do
        expect(File.exist?(main_java)).to be true
      end

      it "should create app folder" do
        expect(File.exist?(app)).to be true
      end

      it "should create controllers folder" do
        expect(File.exist?("#{app}/controllers")).to be true
      end

      it "should create models folder" do
        expect(File.exist?("#{app}/models")).to be true
      end
    end

    context "creating main webapp" do
      let(:webapp) { "#{project_path}/#{Configuration::WEB_APP}" }
      let(:web_inf) { "#{project_path}/#{Configuration::WEB_INF}" }

      it "should create webapp folder" do
        expect(File.exist?(webapp)).to be true
      end

      it "should create WEB-INF folder" do
        expect(File.exist?(web_inf)).to be true
      end

      it "should create application.js" do
        appjs = "#{webapp}/javascripts/application.js"
        expect(File.exist?(appjs)).to be true
      end

      it "should create application.css" do
        source = "#{AppGenerator.source_root}/webapp/stylesheets/application.css"
        destination = "#{webapp}/stylesheets/application.css"
        exists_and_identical?(source, destination)
      end
    end

    context "creating main resources" do
      let(:main_resources) { "#{project_path}/#{Configuration::MAIN_RESOURCES}" }
      let(:meta_inf) { "#{main_resources}/META-INF" }

      it "should create resource folder" do
        expect(File.exist?(main_resources)).to be true
      end

    end
  end
end
