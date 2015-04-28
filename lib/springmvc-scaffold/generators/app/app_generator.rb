class AppGenerator < SpringMvcScaffold::Base

  BUILD_TOOLS = %w( mvn gradle sbt )
  ORMS = %w( jpa hibernate)

  argument :project_path

  class_option :package, default: "app", aliases: "-p", desc: "Define base package"

  class_option :controllers_package, aliases: "-c", default: "controllers", desc: "Define controllers package"

  class_option :models_package, aliases: "-m", default: "models", desc: "Define models package"

  class_option :repositories_package, aliases: "-r", default: "repositories", desc: "Define repositories package"

  class_option :build_tool, aliases: "-b", default: "mvn", desc: "Build tools (options: #{BUILD_TOOLS.join(', ')})"

  class_option :orm, aliases: "-o", default: "jpa", desc: "Object-relational mapping (options: #{ORMS.join(', ')})"

  def self.source_root
    File.join(File.dirname(__FILE__), "templates")
  end

  def self.banner
    "springmvc new #{self.arguments.map(&:usage).join(' ')} [options]"
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
    template("pom.erb", "pom.xml") if build_tool == "mvn"
  end

  def configure_gradle
    template("build.gradle.erb", "build.gradle") if build_tool == "gradle"
  end

  def configure_sbt
    if build_tool == "sbt"
      template("build.sbt.erb", "build.sbt")
      directory("project", "project")
    end
  end

  def create_main_java
    empty_directory Configuration::MAIN_SRC
    @src = File.join(Configuration::MAIN_SRC, options[:package].gsub(".", File::Separator))
  end

  def create_controllers_directory
    empty_directory File.join(@src, options[:controllers_package])
  end

  def create_models_directory
    models = File.join(@src, options[:models_package])
    empty_directory models
    template("models/Entity.erb", "#{models}/Entity.java")
  end

  def create_repositories_directory
    repositories = File.join(@src, options[:repositories_package])
    empty_directory repositories
    template("orm/Repository-#{orm}.java.tt", "#{repositories}/GenericRepository.java")
  end

  def create_main_resources
    directory("resources", Configuration::MAIN_RESOURCES)
  end

  def create_webapp
    @base_package = options[:package]
    @models_package = "#{@base_package}.#{options[:models_package]}"
    directory("webapp", Configuration::WEB_APP)
  end

  def create_javascripts
    javascripts = File.join(Configuration::WEB_APP, "javascripts")
    create_file File.join(javascripts, "application.js")
  end

  def configure_scaffold_properties
    template("springmvc-scaffold.erb", Configuration::FILENAME)
  end

  def create_test
    empty_directory Configuration::TEST_SRC
    test_src = File.join(Configuration::TEST_SRC, options[:package].gsub(".", File::Separator))

    empty_directory File.join(test_src, options[:controllers_package])
    empty_directory File.join(test_src, options[:models_package])
    empty_directory File.join(test_src, options[:repositories_package])

    empty_directory Configuration::TEST_RESOURCES
  end

  private
  def validate
    unless BUILD_TOOLS.include? build_tool
      puts "Build tool #{build_tool} is not supported. The supported build tools are: #{BUILD_TOOLS.join(', ')}"
      Kernel::exit
    end
    unless ORMS.include? orm
      puts "ORM #{orm} is not supported. The supported object-relational mapping are: #{ORMS.join(", ")}"
      Kernel::exit
    end

    if File.directory?(project_path)
      puts "The project #{project_path} already exist"
      Kernel::exit
    end
  end

  def orm
    options[:orm]
  end

  def build_tool
    options[:build_tool]
  end

end
