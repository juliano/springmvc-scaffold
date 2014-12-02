class BaseScaffold < SpringMvcScaffold::Base
  
  def initialize(model, attributes={})
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
    "#{class_name}Repository"
  end

  def repository_test_class_name
    "#{class_name}RepositoryTest"
  end

  def controller_class_name
    "#{class_name}Controller"
  end

  def controller_test_class_name
    "#{class_name}ControllerTest"
  end
end
