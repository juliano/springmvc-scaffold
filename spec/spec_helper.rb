require File.dirname(__FILE__) + '/../lib/springmvc-scaffold'

def exists_and_identical?(source, created)
  c = File.open(created).read.gsub( /\r/m, "" )
  c2 = File.open(source).read.gsub( /\r/m, "" )
  expect(c).to eq c2
end

def build_attributes
  [Attribute.new("name", "string"), Attribute.new("active", "boolean"),
   Attribute.new("price", "double"), Attribute.new("category", "references")]
end

def mock_config_file
  file = YAML.load_file(File.join(File.dirname(__FILE__), "springmvc-scaffold/generators/app/templates/springmvc-scaffold.properties"))
  allow(Configuration).to receive(:config).and_return(file)
end

def double_generator(generator_class)
  generator = double(generator_class)
  allow(generator_class).to receive(:new).with(model, attributes).and_return(generator)
  generator
end
