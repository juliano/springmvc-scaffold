require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe Attribute do

  context "initialize attribute" do
    context "downcase name" do
      it "should downcase all words" do
        expect(described_class.new("VALUE", "double").name).to eq "value"
      end

      it "should camelize composed name" do
        expect(described_class.new("MyItem", "double").name).to eq "myItem"
      end

      it "should camelize composed name" do
        expect(described_class.new("myItem", "double").name).to eq "myItem"
      end

      it "should keep name in downcase" do
        expect(described_class.new("value", "double").name).to eq "value"
      end
    end

    it "should downcase type" do
      expect(described_class.new("value", "DoublE").type).to eq "double"
    end
  end
end
