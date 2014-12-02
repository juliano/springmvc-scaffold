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

  context "supported types" do
    it "should support boolean" do
      expect(described_class::VALID_TYPES.include?("boolean")).to be true
    end

    it "should support double" do
      expect(described_class::VALID_TYPES.include?("double")).to be true
    end

    it "should support string" do
      expect(described_class::VALID_TYPES.include?("string")).to be true
    end

    it "should support float" do
      expect(described_class::VALID_TYPES.include?("float")).to be true
    end

    it "should support short" do
      expect(described_class::VALID_TYPES.include?("short")).to be true
    end

    it "should support integer" do
      expect(described_class::VALID_TYPES.include?("integer")).to be true
    end

    it "should support long" do
      expect(described_class::VALID_TYPES.include?("long")).to be true
    end

    it "should support text" do
      expect(described_class::VALID_TYPES.include?("text")).to be true
    end

    it "should not support other" do
      expect(described_class::VALID_TYPES.include?("other")).to be false
    end

    it "should suport date" do
      expect(described_class::VALID_TYPES.include?("date")).to be true
    end
  end
end
