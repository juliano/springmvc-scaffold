class ModelGenerator < BaseScaffold

  def build
    define_source_paths
    template("model.erb", Configuration.main_class_path(Configuration.models_package, "#{class_name}.java"))
    template("model_test.erb", Configuration.test_class_path(Configuration.models_package, "#{test_class_name}.java"))
  end

  def template_path
    "src/templates/models"
  end

  def source_root
    File.join(File.dirname(__FILE__), "templates")
  end
end
