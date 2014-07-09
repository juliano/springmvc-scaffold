module SpringMvcScaffold

  class Execution
    def run(args)
      action = args.shift
      runner_for(action).new.run(args)
    end

    def runner_for(action)
      SpringMvcScaffold::COMMANDS.fetch(action)
    end
  end

  COMMANDS = {
    "--help" => Runner::Generator,
    "-h" => Runner::Generator,
    "new" => Runner::Generator,
    "scaffold" => Runner::Scaffold
  }
end
