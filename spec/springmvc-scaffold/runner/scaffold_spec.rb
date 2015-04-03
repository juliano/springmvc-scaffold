require 'spec_helper'

describe SpringMvcScaffold::Runner::Scaffold do

  context "scaffold generator" do
    let(:generator) { double(ScaffoldGenerator) }
    let(:args) { ["product", "name:string", "value:double"] }

    it "invokes all scaffold generator tasks" do
      allow(File).to receive(:exists?).and_return(true)
      allow(ScaffoldGenerator).to receive(:new).with(args).and_return(generator)
      expect(generator).to receive(:invoke_all)

      subject.run(args)
    end

    context "outside root folder" do
      before { allow(File).to receive(:exists?).and_return(false) }

      it "cannot invoke scaffold generator" do
        expect(ScaffoldGenerator).to_not receive(:new)
        subject.run(args)
      end

      it "asks user to go to root folder" do
        expect(Kernel).to receive(:puts).with("To run springmvc scaffold please go to the project root folder.")
        subject.run(args)
      end
    end
  end

end
