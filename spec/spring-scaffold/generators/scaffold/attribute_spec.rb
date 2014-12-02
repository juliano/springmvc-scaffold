require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe Attribute do

  context "getter method prefix" do
    it "should be 'is' to boolean attributes" do
      expect(described_class.new("active", "boolean").getter_prefix).to eq "is"
    end

    it "should be 'get' otherwise" do
      expect(described_class.new("description", "string").getter_prefix).to eq "get"
    end
  end

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
    subject(:valid_types) { described_class::VALID_TYPES }

    it "supports boolean" do
      expect(valid_types.include?("boolean")).to be true
    end

    it "supports double" do
      expect(valid_types.include?("double")).to be true
    end

    it "supports string" do
      expect(valid_types.include?("string")).to be true
    end

    it "supports float" do
      expect(valid_types.include?("float")).to be true
    end

    it "supports short" do
      expect(valid_types.include?("short")).to be true
    end

    it "supports integer" do
      expect(valid_types.include?("integer")).to be true
    end

    it "supports long" do
      expect(valid_types.include?("long")).to be true
    end

    it "supports text" do
      expect(valid_types.include?("text")).to be true
    end

    it "supports date" do
      expect(valid_types.include?("date")).to be true
    end

    it "do not support other" do
      expect(valid_types.include?("other")).to be false
    end

    context "html_input" do
      it "should know html input to boolean" do
        expect(described_class.new("flag", "boolean").html_input).to eq "checkbox"
      end

      it "should know html input to string" do
        expect(described_class.new("name", "string").html_input).to eq "text"
      end

      it "should know html input to double" do
        expect(described_class.new("name", "double").html_input).to eq "text"
      end

      it "should know html input to float" do
        expect(described_class.new("name", "float").html_input).to eq "text"
      end

      it "should know html input to short" do
        expect(described_class.new("name", "short").html_input).to eq "text"
      end

      it "should know html input to integer" do
        expect(described_class.new("name", "integer").html_input).to eq "text"
      end

      it "should know html input to long" do
        expect(described_class.new("name", "long").html_input).to eq "text"
      end

      it "should know html input to text" do
        expect(described_class.new("name", "text").html_input).to eq "textarea"
      end

      it "should know html input to date" do
        expect(described_class.new("price", "date").html_input).to eq "text"
      end
    end
  end
end
