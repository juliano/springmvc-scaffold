require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe AppGenerator do

  context "build new application" do
    let(:project_path) { "src/springmvc-scaffold" }

    before { described_class.new(project_path, []).invoke_all }

    after { FileUtils.remove_dir("src") }

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

    it "cannot create build.gradle" do
      expect(File.exist?("#{project_path}/build.gradle")).to be false
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

      it "should create repositories folder" do
        expect(File.exist?("#{app}/repositories")).to be true
      end
    end

    context "creating main resources" do
      let(:main_resources) { "#{project_path}/#{Configuration::MAIN_RESOURCES}" }
      let(:meta_inf) { "#{main_resources}/META-INF" }

      it "should create resources folder" do
        expect(File.exist?(main_resources)).to be true
      end

      it "should create hibernate.properties" do
        source = "#{AppGenerator.source_root}/resources/hibernate.properties"
        destination = "#{main_resources}/hibernate.properties"
        exists_and_identical?(source, destination)
      end

      it "should create log4j" do
        source = "#{AppGenerator.source_root}/resources/log4j.properties"
        destination = "#{main_resources}/log4j.properties"
        exists_and_identical?(source, destination)
      end

      it "should create messages.properties" do
        source = "#{AppGenerator.source_root}/resources/messages.properties"
        destination = "#{main_resources}/messages.properties"
        exists_and_identical?(source, destination)
      end

      context "jpa orm" do
        it "should create META-INF" do
          expect(File.exist?(meta_inf)).to be true
        end

        it "should create persistence.xml" do
          source = "#{AppGenerator.source_root}/orm/META-INF/persistence.xml"
          destination = "#{meta_inf}/persistence.xml"
          exists_and_identical?(source, destination)
        end

        it "cannot create hibernate.cfg.xml" do
          expect(File.exist?("#{main_resources}/hibernate.cfg.xml")).to be false
        end
      end

      context "hibernate orm" do
        before do
          @project_path = "src/springmvc-scaffold-hibernate"
          @main_resources = "#{@project_path}/#{Configuration::MAIN_RESOURCES}"
          @meta_inf = "#{@main_resources}/META-INF"

          described_class.new(@project_path, ["-o=hibernate"]).invoke_all
        end

        after { FileUtils.remove_dir(@project_path) }

        it "should create hibernate.cfg.xml" do
          source = "#{AppGenerator.source_root}/orm/hibernate.cfg.xml"
          destination = "#{@main_resources}/hibernate.cfg.xml"
          exists_and_identical?(source, destination)
        end

        it "cannot create META-INF" do
          expect(File.exist?(@meta_inf)).to be false
        end

        it "cannot create persistence.xml" do
          expect(File.exist?("#{@meta_inf}/persistence.xml")).to be false
        end
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

    context "creating test" do
      let(:test_java) { "#{project_path}/#{Configuration::TEST_SRC}" }
      let(:test_resources) { "#{project_path}/#{Configuration::TEST_RESOURCES}" }
      let(:app) { "#{test_java}/app" }

      it "should create test source folder" do
        expect(File.exist?(test_java)).to be true
      end

      it "should create test resources folder" do
        expect(File.exist?(test_resources)).to be true
      end

      it "should create controllers folder" do
        expect(File.exist?("#{app}/controllers")).to be true
      end

      it "should create models folder" do
        expect(File.exist?("#{app}/models")).to be true
      end

      it "should create repositories folder" do
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

    it "should create main path" do
      expect(File.exist?(main_java)).to be true
    end

    it "should create test path" do
      expect(File.exist?(test_java)).to be true
    end
  end

  context "creating gradle application" do
    let(:project_path) { "springmvc-scaffold" }

    before { described_class.new(project_path, ["-b=gradle"]).invoke_all }

    after { FileUtils.remove_dir(project_path) }

    it "should create build.gradle" do
      source = File.join(File.dirname(__FILE__), "templates", "build.gradle")
      destination = "#{project_path}/build.gradle"
      exists_and_identical?(source, destination)
    end

    it "cannot create pom.xml" do
      expect(File.exist?("#{project_path}/pom.xml")).to be false
    end
  end

  context "valid build tools" do
    it "maven should be valid" do
      expect(AppGenerator::BUILD_TOOLS.include?("mvn")).to be true
    end

    it "gradle should be valid" do
      expect(AppGenerator::BUILD_TOOLS.include?("gradle")).to be true
    end
  end

  context "valid orm" do
    it "jpa should be valid" do
      expect(AppGenerator::ORMS.include?("jpa")).to be true
    end

    it "hibernate should be valid" do
      expect(AppGenerator::ORMS.include?("hibernate")).to be true
    end
  end

  context "validate options" do
    let(:project_path) { "springmvc-scaffold" }

    it "should be invalid when build tool is not supported" do
      expect(Kernel).to receive(:exit)
      AppGenerator.new(project_path, ["-b=maven"])
    end

    it "should be invalid when orm is not supported" do
      expect(Kernel).to receive(:exit)
      AppGenerator.new(project_path, ["-o=toplink"])
    end
  end
end
