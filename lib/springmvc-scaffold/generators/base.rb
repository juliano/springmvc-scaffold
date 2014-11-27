module SpringMvcScaffold
  class Base < Thor::Group
    include Thor::Actions
  end
end

require File.dirname(__FILE__) + '/app/app_generator'
require File.dirname(__FILE__) + '/app/dependencies'
require File.dirname(__FILE__) + '/app/dependency'
require File.dirname(__FILE__) + '/scaffold/model/model_generator'
