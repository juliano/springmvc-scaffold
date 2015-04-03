require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe ScaffoldGenerator do
  let(:model) { "product" }
  let(:args) { [model, { "name" => "string", "value" => "double" }] }
  subject { described_class.new(args) }
  let(:attributes) { subject.generated_attributes }

  it "configures banner" do
    expect(described_class.banner).to eq "springmvc scaffold MODEL [field:type field:type]"
  end

  context "generated attributes" do
    it "generates name attribute" do
      att = attributes.first
      expect(att.name).to eq "name"
      expect(att.type).to eq "string"
    end

    it "generates value attribute" do
      att = attributes.last
      expect(att.name).to eq "value"
      expect(att.type).to eq "double"
    end
  end

  context "generators" do
    before do
      allow(YAML).to receive(:load_file).with(Configuration::FILENAME).and_return({})
    end

    it "calls controller generator" do
      controller_generator = double_generator(ControllerGenerator)
      expect(controller_generator).to receive(:build)

      subject.controller_generator
    end

    it "calls model generator" do
      model_generator = double_generator(ModelGenerator)
      expect(model_generator).to receive(:build)

      subject.model_generator
    end

    it "calls jsp generator" do
      template_generator = double_generator(JspGenerator)
      expect(template_generator).to receive(:build)

      subject.template_generator
    end

    it "calls repository generator" do
      repository_generator = double_generator(RepositoryGenerator)
      expect(repository_generator).to receive(:build)

      subject.repository_generator
    end
  end
end
