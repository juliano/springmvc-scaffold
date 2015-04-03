require "spec_helper"

describe SpringMvcScaffold::Runner::Generator do
  let(:generator) { double(AppGenerator) }
  let(:project_name) { "springmvc-scaffold" }
  let(:option) { "-p=br.com.company" }
  let(:args) { [project_name, option] }

  before { allow(AppGenerator).to receive(:new).with(project_name, [option]).and_return(generator) }

  it "should invoke all app generator tasks when typed new" do
    expect(generator).to receive(:invoke_all)
    subject.run(args)
  end

  it "prints help command" do
    expect(AppGenerator).to receive(:start).with(["-h"])
    subject.run(["--help"])
  end

end
