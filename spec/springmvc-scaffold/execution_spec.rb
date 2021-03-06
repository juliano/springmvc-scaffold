require "spec_helper"

describe SpringMvcScaffold::Execution do

  context "discover runner for action" do
    it "should be commands help when no action" do
      expect(subject.runner_for(nil)).to be SpringMvcScaffold::Runner::CommandsHelp
    end

    it "should be app generator when -h action" do
      expect(subject.runner_for("-h")).to be SpringMvcScaffold::Runner::Generator
    end

    it "should be app generator when --help action" do
      expect(subject.runner_for("--help")).to be SpringMvcScaffold::Runner::Generator
    end

    it "should be app generator when new action" do
      expect(subject.runner_for("new")).to be SpringMvcScaffold::Runner::Generator
    end

    it "should be app generator when scaffold action" do
      expect(subject.runner_for("scaffold")).to be SpringMvcScaffold::Runner::Scaffold
    end

    it "should be commands help when scaffold when unknown action" do
      expect(subject.runner_for("xpto")).to be SpringMvcScaffold::Runner::CommandsHelp
    end
  end

  it "should discover runner and run" do
    runner = double(SpringMvcScaffold::Runner::Generator)
    allow(runner).to receive(:new).and_return(runner)
    expect(runner).to receive(:run).with(['app'])

    allow(subject).to receive(:runner_for).with('new').and_return(runner)
    subject.run(['new', 'app'])
  end

end
