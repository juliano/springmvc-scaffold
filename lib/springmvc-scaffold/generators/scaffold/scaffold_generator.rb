class ScaffoldGenerator < SpringMvcScaffold::Base

  attr_accessor :generated_attributes
  argument :model
  argument :attributes, type: :hash, default: {}, banner: "field:type field:type"

  def self.banner
    "springmvc scaffold #{self.arguments.map(&:usage).join(' ')}"
  end

  def initialize(args)
    super(args)
    @generated_attributes = attributes.map {|field, type| Attribute.new(field, type) }
  end

  def controller_generator
    ControllerGenerator.new(model, generated_attributes).build
  end

  def model_generator
    ModelGenerator.new(model, generated_attributes).build
  end

  def template_generator
    JspGenerator.new(model, generated_attributes).build
  end

  def repository_generator
    RepositoryGenerator.new(model, generated_attributes).build
  end
end
