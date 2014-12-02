class Attribute
  VALID_TYPES = %w(boolean double float short integer long string text date references)

  attr_accessor :name, :type

  def initialize(name, type)
    @name = name.underscore.camelize(:lower)
    @type = type.downcase
    validate
  end

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

  def boolean?
    type == "boolean"
  end
end
