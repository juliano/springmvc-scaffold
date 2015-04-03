module SpringMvcScaffold::Runner

  class CommandsHelp
    def run(args)
      Kernel.puts "Available runners for springmvc are: #{SpringMvcScaffold::COMMANDS.keys.join(', ')}"
      Kernel.puts "Usage:"
      Kernel.puts "  springmvc runner"
    end
  end

end
