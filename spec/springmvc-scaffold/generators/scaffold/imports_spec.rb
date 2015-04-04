require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe Imports do

  it "imports package when type is Date" do
    expect(Imports.new("date").package).to include("java.util.Date")
  end

end
