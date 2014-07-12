class AppGenerator < SpringMvcScaffold::Base

  argument :project_path

  def initialize(args, opts=[])
    super([args], opts)
    validate
    self.destination_root = project_path
  end

  def create_root_folder
    empty_directory "."
  end

  private
  def validate
    if File.directory?(project_path)
      puts "The project #{project_path} already exist"
      Kernel::exit
    end
  end
end
