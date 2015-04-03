module SpringMvcScaffold::Runner

  class Generator
    def run(args)
      project_path = args.shift
      if SpringMvcScaffold::Runner::Help.help?(project_path)
        AppGenerator.start(["-h"])
      else
        AppGenerator.new(project_path, args).invoke_all
      end
    end
  end

end
