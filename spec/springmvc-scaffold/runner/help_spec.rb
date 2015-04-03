require "spec_helper"

describe SpringMvcScaffold::Runner::Help do

  context "user asking to see springmvc help" do
    it "is true when nil" do
      expect(described_class.help?(nil)).to be true
    end

    it "is true when -h" do
      expect(described_class.help?('-h')).to be true
    end

    it "is true when --help" do
      expect(described_class.help?('--help')).to be true
    end

    it "is false otherwise" do
      expect(described_class.help?('scaffold')).to be false
    end
  end
end
