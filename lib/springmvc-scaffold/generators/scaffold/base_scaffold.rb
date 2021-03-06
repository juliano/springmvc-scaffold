class BaseScaffold < SpringMvcScaffold::Base

  def initialize(model, attributes={})
    super()
    @model = model
    @attributes = attributes
  end

  def class_name
    @model.camelize
  end

  def model_parameter_name
    @model.camelize(:lower)
  end

  def test_class_name
    "#{class_name}Test"
  end

  def repository_class_name
    class_name.pluralize
  end

  def repository_name
    repository_class_name.downcase
  end

  def repository_test_class_name
    "#{class_name.pluralize}Test"
  end

  def controller_class_name
    "#{class_name.pluralize}Controller"
  end

  def controller_test_class_name
    "#{class_name.pluralize}ControllerTest"
  end

  def base_path
    model_parameter_name.pluralize
  end

  def imports
    @attributes.map(&:import).uniq.reject(&:empty?).flatten
  end

  protected
  def define_source_paths
    source_paths << File.expand_path(template_path) if File.exist?(template_path)
    source_paths << source_root
  end
end
