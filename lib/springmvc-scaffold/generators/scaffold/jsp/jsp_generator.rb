class JspGenerator < BaseScaffold

  def build
    define_source_paths
    create_view("index")
    create_view("show")
    create_view("form")
    create_view("edit")
    create_view("new", "new#{class_name}")
  end

  def create_view(template_name, file_name=template_name)
    template("#{template_name}.erb", "#{views_path}/#{file_name}.#{extension}")
  end

  def views_path
    File.join(Configuration::WEB_INF, view_folder, base_path)
  end

  def template_path
    "src/templates/views"
  end

  def view_folder
    "jsp"
  end

  def extension
    "jsp"
  end

  def path url=""
    %Q{${pageContext.request.contextPath}/#{base_path}#{url}}
  end
  
  def source_root
    File.join(File.dirname(__FILE__), "templates")
  end

end
