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

def mock_http_request
  http = double(Net::HTTP)
  expect(http).to receive(:get).with(kind_of(String)).and_return http
  expect(http).to receive(:body).and_return('body')
  expect(SpringMvcScaffold::Downloader).to receive(:open_session).with(kind_of(String)).and_return(http)
end

def mock_http_request_error
  http = double(Net::HTTP)
  expect(http).to receive(:get).with(kind_of(String)).and_throw(Net::HTTPError)
  expect(SpringMvcScaffold::Downloader).to receive(:open_session).with(kind_of(String)).and_return(http)
end
