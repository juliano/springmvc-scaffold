class AppGenerator < SpringMvcScaffold::Base

  argument :project_path

  class_option :package, default: "app", aliases: "-p", desc: "Define base package"

  class_option :controllers_package, aliases: "-c", default: "controllers", desc: "Define controllers package"

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

  private
  def validate
    if File.directory?(project_path)
      puts "The project #{project_path} already exist"
      Kernel::exit
    end
  end
end
