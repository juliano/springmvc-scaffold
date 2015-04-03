module SpringMvcScaffold::Runner

  class Scaffold
    def run(args)
      if SpringMvcScaffold::Runner::Help.help?(args.first)
        ScaffoldGenerator.start(["-h"])
      elsif File.exists?("src")
        ScaffoldGenerator.new(args).invoke_all
      else
        Kernel.puts "To run springmvc scaffold please go to the project root folder."
      end
    end
  end

end
