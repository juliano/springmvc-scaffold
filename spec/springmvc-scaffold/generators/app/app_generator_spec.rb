require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe AppGenerator do

  context "build new application" do
    let(:project_path) { "src/springmvc-scaffold" }

    before { described_class.new(project_path).invoke_all }

    after { FileUtils.remove_dir("src") }

    it "creates directory with project name" do
      expect(File.exist?(project_path)).to be true
    end

    it "is invalid when project name already exist" do
      expect(Kernel).to receive(:exit)
      described_class.new(project_path)
    end

    it "creates pom.xml" do
      source = File.join(File.dirname(__FILE__), "templates", "pom.xml")
      destination = "#{project_path}/pom.xml"
      exists_and_identical?(source, destination)
    end

    it "cannot create build.gradle" do
      expect(File.exist?("#{project_path}/build.gradle")).to be false
    end

    it "configures springmvc-scaffold.properties" do
      source = File.join(File.dirname(__FILE__), "templates", "springmvc-scaffold.properties")
      destination = "#{project_path}/#{Configuration::FILENAME}"
      exists_and_identical?(source, destination)
    end

    context "creating main java" do
      let(:main_java) { "#{project_path}/#{Configuration::MAIN_SRC}" }
      let(:app) { "#{main_java}/app" }

      it "creates source folder" do
        expect(File.exist?(main_java)).to be true
      end

      it "creates app folder" do
        expect(File.exist?(app)).to be true
      end

      it "creates controllers folder" do
        expect(File.exist?("#{app}/controllers")).to be true
      end

      it "creates models folder" do
        expect(File.exist?("#{app}/models")).to be true
      end

      it "creates generic entity" do
        source = File.join(File.dirname(__FILE__), "templates", "Entity.java")
        destination = "#{app}/models/Entity.java"
        exists_and_identical?(source, destination)
      end

      it "creates repositories folder" do
        expect(File.exist?("#{app}/repositories")).to be true
      end

      it "creates generic repository" do
        source =  File.join(File.dirname(__FILE__), "templates", "RepositoryJPA.java")
        destination = "#{app}/repositories/GenericRepository.java"
        exists_and_identical?(source, destination)
      end
    end

    context "creating main resources" do
      let(:main_resources) { "#{project_path}/#{Configuration::MAIN_RESOURCES}" }

      it "creates resources folder" do
        expect(File.exist?(main_resources)).to be true
      end

      it "creates hibernate.properties" do
        source = "#{AppGenerator.source_root}/resources/hibernate.properties"
        destination = "#{main_resources}/hibernate.properties"
        exists_and_identical?(source, destination)
      end

      it "creates log4j" do
        source = "#{AppGenerator.source_root}/resources/log4j.properties"
        destination = "#{main_resources}/log4j.properties"
        exists_and_identical?(source, destination)
      end

      it "creates messages.properties" do
        source = "#{AppGenerator.source_root}/resources/messages.properties"
        destination = "#{main_resources}/messages.properties"
        exists_and_identical?(source, destination)
      end
    end

    context "creating main webapp" do
      let(:webapp) { "#{project_path}/#{Configuration::WEB_APP}" }
      let(:web_inf) { "#{project_path}/#{Configuration::WEB_INF}" }

      it "creates webapp folder" do
        expect(File.exist?(webapp)).to be true
      end

      it "creates WEB-INF folder" do
        expect(File.exist?(web_inf)).to be true
      end

      it "creates application.js" do
        appjs = "#{webapp}/javascripts/application.js"
        expect(File.exist?(appjs)).to be true
      end

      it "creates application.css" do
        source = "#{AppGenerator.source_root}/webapp/stylesheets/application.css"
        destination = "#{webapp}/stylesheets/application.css"
        exists_and_identical?(source, destination)
      end
    end

    context "creating test" do
      let(:test_java) { "#{project_path}/#{Configuration::TEST_SRC}" }
      let(:test_resources) { "#{project_path}/#{Configuration::TEST_RESOURCES}" }
      let(:app) { "#{test_java}/app" }

      it "creates test source folder" do
        expect(File.exist?(test_java)).to be true
      end

      it "creates test resources folder" do
        expect(File.exist?(test_resources)).to be true
      end

      it "creates controllers folder" do
        expect(File.exist?("#{app}/controllers")).to be true
      end

      it "creates models folder" do
        expect(File.exist?("#{app}/models")).to be true
      end

      it "creates repositories folder" do
        expect(File.exist?("#{app}/repositories")).to be true
      end
    end
  end

  context "build app with complex package" do
    let(:project_path) { "src/springmvc-scaffold" }
    let(:main_java) { "#{project_path}/#{Configuration::MAIN_SRC}/br/com/juliano" }
    let(:test_java) { "#{project_path}/#{Configuration::TEST_SRC}/br/com/juliano" }

    before do
      described_class.new(project_path, ["-p=br.com.juliano"]).invoke_all
    end

    after { FileUtils.remove_dir("src") }

    it "creates main path" do
      expect(File.exist?(main_java)).to be true
    end

    it "creates test path" do
      expect(File.exist?(test_java)).to be true
    end
  end

  context "creating gradle application" do
    let(:project_path) { "springmvc-scaffold" }

    before { described_class.new(project_path, ["-b=gradle"]).invoke_all }

    after { FileUtils.remove_dir(project_path) }

    it "creates build.gradle" do
      source = File.join(File.dirname(__FILE__), "templates", "build.gradle")
      destination = "#{project_path}/build.gradle"
      exists_and_identical?(source, destination)
    end

    it "cannot create pom.xml" do
      expect(File.exist?("#{project_path}/pom.xml")).to be false
    end
  end

  context "valid build tools" do
    it "maven is valid" do
      expect(AppGenerator::BUILD_TOOLS.include?("mvn")).to be true
    end

    it "gradle is valid" do
      expect(AppGenerator::BUILD_TOOLS.include?("gradle")).to be true
    end
  end

  context "valid orm" do
    it "jpa is valid" do
      expect(AppGenerator::ORMS.include?("jpa")).to be true
    end

    it "hibernate is valid" do
      expect(AppGenerator::ORMS.include?("hibernate")).to be true
    end
  end

  context "validate options" do
    let(:project_path) { "springmvc-scaffold" }

    it "is invalid when build tool is not supported" do
      expect(Kernel).to receive(:exit)
      AppGenerator.new(project_path, ["-b=maven"])
    end

    it "is invalid when orm is not supported" do
      expect(Kernel).to receive(:exit)
      AppGenerator.new(project_path, ["-o=toplink"])
    end
  end

  it "configures banner" do
    expect(AppGenerator.banner).to eq "springmvc new PROJECT_PATH [options]"
  end
end
