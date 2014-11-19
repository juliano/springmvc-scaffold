class AppGenerator < SpringMvcScaffold::Base

  argument :project_path

  class_option :package, default: "app", aliases: "-p", desc: "Define base package"

  class_option :controllers_package, aliases: "-c", default: "controllers", desc: "Define controllers package"

  class_option :models_package, aliases: "-m", default: "models", desc: "Define models package"

  def self.source_root
    File.join(File.dirname(__FILE__), "templates")
  end

  def initialize(args, opts=[])
    super([args], opts)
    validate
    self.destination_root = project_path
    @project_name = project_path.split("/").last
  end

  def create_root_folder
    empty_directory "."
  end

  def configure_maven
    template("pom.erb", "pom.xml")
  end

  def create_main_java
    empty_directory Configuration::MAIN_SRC
    @src = File.join(Configuration::MAIN_SRC, options[:package].gsub(".", File::Separator))
  end

  def create_controllers_directory
    empty_directory File.join(@src, options[:controllers_package])
  end

  def create_models_directory
    empty_directory File.join(@src, options[:models_package])
  end

  def create_webapp
    directory("webapp", Configuration::WEB_APP)
  end

  def create_javascripts
    javascripts = File.join(Configuration::WEB_APP, "javascripts")
    create_file File.join(javascripts, "application.js")
  end

  def create_main_resources
    directory("resources", Configuration::MAIN_RESOURCES)
  end

  def create_test
    empty_directory Configuration::TEST_SRC
    test_src = File.join(Configuration::TEST_SRC, options[:package].gsub(".", File::Separator))

    empty_directory(File.join(test_src, options[:controllers_package]))
    empty_directory(File.join(test_src, options[:models_package]))

    empty_directory Configuration::TEST_RESOURCES
  end

  private
  def validate
    if File.directory?(project_path)
      puts "The project #{project_path} already exist"
      Kernel::exit
    end
  end
end
