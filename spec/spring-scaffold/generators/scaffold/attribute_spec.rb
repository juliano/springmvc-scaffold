require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe Attribute do

  context "getter name" do
    it "'is' to boolean attributes" do
      expect(described_class.new("active", "boolean").getter_name).to eq "isActive"
    end

    it "'get' otherwise" do
      expect(described_class.new("description", "string").getter_name).to eq "getDescription"
    end
  end

  it "setter name" do
    expect(described_class.new("name", "string").setter_name).to eq "setName"
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
  end

  context "html_input" do
    it "knows html input to boolean" do
      expect(described_class.new("flag", "boolean").html_input).to eq "checkbox"
    end

    it "knows html input to string" do
      expect(described_class.new("name", "string").html_input).to eq "text"
    end

    it "knows html input to double" do
      expect(described_class.new("name", "double").html_input).to eq "text"
    end

    it "knows html input to float" do
      expect(described_class.new("name", "float").html_input).to eq "text"
    end

    it "knows html input to short" do
      expect(described_class.new("name", "short").html_input).to eq "text"
    end

    it "knows html input to integer" do
      expect(described_class.new("name", "integer").html_input).to eq "text"
    end

    it "knows html input to long" do
      expect(described_class.new("name", "long").html_input).to eq "text"
    end

    it "knows html input to text" do
      expect(described_class.new("name", "text").html_input).to eq "textarea"
    end

    it "knows html input to date" do
      expect(described_class.new("price", "date").html_input).to eq "text"
    end
  end

  context "java type" do
    it "knows correct java type to boolean" do
      expect(described_class.new("flag", "boolean").java_type).to eq "boolean"
    end

    it "knows correct java type to text" do
      expect(described_class.new("description", "text").java_type).to eq "String"
    end

    it "knows correct java type to string" do
      expect(described_class.new("name", "string").java_type).to eq "String"
    end

    it "knows correct java type to double" do
      expect(described_class.new("name", "double").java_type).to eq "Double"
    end

    it "knows correct java type to float" do
      expect(described_class.new("name", "float").java_type).to eq "Float"
    end

    it "knows correct java type to short" do
      expect(described_class.new("name", "short").java_type).to eq "Short"
    end

    it "knows correct java type to integer" do
      expect(described_class.new("name", "integer").java_type).to eq "Integer"
    end

    it "knows correct java type to long" do
      expect(described_class.new("name", "long").java_type).to eq "Long"
    end

    it "knows correct java type to Date" do
      expect(described_class.new("price", "date").java_type).to eq "Date"
    end

    it "knows correct type to relationship many to one" do
      expect(described_class.new("product", "references").java_type).to eq "Product"
    end
  end

  context "validate" do
    it "should be valid when attribute is supported" do
      expect(Kernel).to_not receive(:exit)
      described_class::VALID_TYPES.each do |type|
        described_class.new("name", type)
      end
    end

    it "cannot be valid when attribute is not supported" do
      expect(Kernel).to receive(:exit)
      described_class.new("name", "char")
    end

    it "should be valid when attribute is upper case" do
      expect(Kernel).to_not receive(:exit)
      described_class.new("name", "String")
    end
  end

  context "boolean?" do
    it "should be boolean when type is boolean" do
      expect(described_class.new("flag", "boolean").boolean?).to be true
    end

    it "cannot be boolean otherwise" do
      expect(described_class.new("flag", "short").boolean?).to be false
    end
  end

  context "html label" do
    it "should humanize composed name" do
      expect(described_class.new("MyItem", "double").html_label).to eq "My item"
    end

    it "should humanize composed name" do
      expect(described_class.new("myItem", "double").html_label).to eq "My item"
    end

    it "should humanize single name" do
      expect(described_class.new("item", "double").html_label).to eq "Item"
    end
  end
end
