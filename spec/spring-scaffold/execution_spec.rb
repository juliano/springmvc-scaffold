require "spec_helper"

describe SpringMvcScaffold::Execution do

  before do
    @execution = SpringMvcScaffold::Execution.new
  end

  context "discover runner for action" do
    it "should be commands help when no action" do
      runner = @execution.runner_for(nil)
      expect(runner).to be SpringMvcScaffold::Runner::CommandsHelp
    end

    it "should be app generator when -h action" do
      runner = @execution.runner_for("-h")
      expect(runner).to be SpringMvcScaffold::Runner::Generator
    end

    it "should be app generator when --help action" do
      runner = @execution.runner_for("--help")
      expect(runner).to be SpringMvcScaffold::Runner::Generator
    end

    it "should be app generator when new action" do
      runner = @execution.runner_for("new")
      expect(runner).to be SpringMvcScaffold::Runner::Generator
    end

    it "should be app generator when scaffold action" do
      runner = @execution.runner_for("scaffold")
      expect(runner).to be SpringMvcScaffold::Runner::Scaffold
    end

    it "should be commands help when scaffold when unknown action" do
      runner = @execution.runner_for("xpto")
      expect(runner).to be SpringMvcScaffold::Runner::CommandsHelp
    end
  end

end
