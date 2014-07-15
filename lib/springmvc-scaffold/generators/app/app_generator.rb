class AppGenerator < SpringMvcScaffold::Base

  argument :project_path

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
    empty_directory "src/main/java"
  end

  private
  def validate
    if File.directory?(project_path)
      puts "The project #{project_path} already exist"
      Kernel::exit
    end
  end
end
