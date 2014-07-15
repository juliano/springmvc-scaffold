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

      it "should create source folder" do
        expect(File.exist?(main_java)).to be true
      end
    end
  end
end
