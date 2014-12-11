module SpringMvcScaffold
  class Base < Thor::Group
    include Thor::Actions
  end
end

require File.dirname(__FILE__) + '/app/app_generator'
require File.dirname(__FILE__) + '/app/dependencies'
require File.dirname(__FILE__) + '/app/dependency'
require File.dirname(__FILE__) + '/scaffold/scaffold_generator'
require File.dirname(__FILE__) + '/scaffold/base_scaffold'
require File.dirname(__FILE__) + '/scaffold/attribute'
require File.dirname(__FILE__) + '/scaffold/model/model_generator'
require File.dirname(__FILE__) + '/scaffold/controller/controller_generator'
