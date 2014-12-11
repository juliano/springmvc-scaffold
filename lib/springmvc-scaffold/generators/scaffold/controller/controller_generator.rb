class ControllerGenerator < BaseScaffold

  def template_path
    "src/templates/controllers"
  end

  def path
    "/#{base_path}"
  end

  def source_root
    File.join(File.dirname(__FILE__), "templates")
  end
end
