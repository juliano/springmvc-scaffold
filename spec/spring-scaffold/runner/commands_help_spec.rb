require "spec_helper"

describe SpringMvcScaffold::Runner::CommandsHelp do

  it "should print commands help" do
    expect(Kernel).to receive(:puts).with("Available runners for springmvc are: #{SpringMvcScaffold::COMMANDS.keys.join(', ')}")
    expect(Kernel).to receive(:puts).with("Usage:")
    expect(Kernel).to receive(:puts).with("  springmvc runner")

    SpringMvcScaffold::Runner::CommandsHelp.new.run('')
  end

end
