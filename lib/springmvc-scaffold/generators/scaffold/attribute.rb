class Attribute
  VALID_TYPES = %w(boolean double float short integer long string text date references)

  attr_accessor :name, :type

  def initialize(name, type)
    @name = name.underscore.camelize(:lower)
    @type = type.downcase
    validate
  end

  def getter_name
    getter_prefix + name.camelize
  end

  def setter_name
    "set#{name.camelize}"
  end

  def boolean?
    type == "boolean"
  end

  def is_reference?
    type.eql?("references")
  end

  def declaration
    "#{java_type} #{name}"
  end

  def java_type
    java = type.capitalize
    java = "boolean" if boolean?
    java = "String" if type.eql?("text")
    java = "Date" if type.eql?("date")
    java = name.camelize if is_reference?
    java
  end

  def html_input
    input = "input"
    input = "checkbox" if boolean?
    input = "textarea" if type == "text"
    input
  end

  def import
    Imports.new(type).package
  end

  def html_label
    name.underscore.humanize
  end

  private
  def validate
    unless VALID_TYPES.include?(@type)
      puts "Attribute #{@type} is not supported. The supported attributes types are: #{VALID_TYPES.join(", ")}"
      Kernel::exit
    end
  end

  def getter_prefix
    return "is" if boolean?
    "get"
  end
end
