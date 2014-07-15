require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Configuration do

  it "should configure main source" do
    expect(Configuration::MAIN_SRC).to eq "src/main/java"
  end

  it "should configure webapp" do
    expect(Configuration::WEB_APP).to eq "src/main/webapp"
  end

  it "should configure web-inf" do
    expect(Configuration::WEB_INF).to eq "#{Configuration::WEB_APP}/WEB-INF"
  end

end
