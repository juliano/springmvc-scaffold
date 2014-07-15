require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Configuration do

  it "should configure main source" do
    expect(Configuration::MAIN_SRC).to eq "src/main/java"
  end

end
