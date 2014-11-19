require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe Dependency do

  it "should has exclusions" do
    dependency = described_class.new("org.springframework", "spring-web", "4.0.0", [described_class.new("org.springframework", "spring-orm")])
    expect(dependency.has_exclusions?).to be true
  end

  it "cannot has exclusions" do
    dependency = described_class.new("org.springframework", "spring-web", "3.0.0")
    expect(dependency.has_exclusions?).to be false
  end
end
