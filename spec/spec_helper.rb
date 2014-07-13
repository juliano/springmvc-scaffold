require File.dirname(__FILE__) + '/../lib/springmvc-scaffold'

def exists_and_identical?(source, created)
  c = File.open(created).read.gsub( /\r/m, "" )
  c2 = File.open(source).read.gsub( /\r/m, "" )
  expect(c).to eq c2
end
