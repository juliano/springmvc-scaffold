module SpringMvcScaffold
  class Base < Thor::Group
    include Thor::Actions
  end
end

require File.dirname(__FILE__) + '/app/app_generator'
