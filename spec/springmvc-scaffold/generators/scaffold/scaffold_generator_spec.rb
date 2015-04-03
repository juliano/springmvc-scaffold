require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe ScaffoldGenerator do
  let(:model) { "product" }
  let(:args) { [model, { "name" => "string", "value" => "double" }] }
  subject { described_class.new(args) }
  let(:attributes) { subject.generated_attributes }

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
    it "calls controller generator" do
      controller_generator = double(ControllerGenerator)
      allow(ControllerGenerator).to receive(:new).with(model, attributes).and_return(controller_generator)
      expect(controller_generator).to receive(:build)

      subject.controller_generator
    end

    it "calls model generator" do
      config = {}
      allow(YAML).to receive(:load_file).with(Configuration::FILENAME).and_return(config)
      model_generator = double(ModelGenerator)
      allow(ModelGenerator).to receive(:new).with(model, attributes).and_return(model_generator)
      expect(model_generator).to receive(:build)

      subject.model_generator
    end

    it "calls jsp generator" do
      template_generator = double(JspGenerator)
      allow(JspGenerator).to receive(:new).with(model, attributes).and_return(template_generator)
      expect(template_generator).to receive(:build)

      subject.template_generator
    end

    it "calls repository generator" do
      config = {}
      allow(YAML).to receive(:load_file).with(Configuration::FILENAME).and_return(config)
      repository_generator = double(RepositoryGenerator)
      allow(RepositoryGenerator).to receive(:new).with(model, attributes).and_return(repository_generator)
      expect(repository_generator).to receive(:build)

      subject.repository_generator
    end
  end
end
