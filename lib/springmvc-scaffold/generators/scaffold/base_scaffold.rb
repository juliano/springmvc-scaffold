class BaseScaffold < SpringMvcScaffold::Base
  
  def initialize(model)
    @model = model
  end

  def class_name
    @model.camelize
  end

  def test_class_name
    "#{class_name}Test"
  end
end
