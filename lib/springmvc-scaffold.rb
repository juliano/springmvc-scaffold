module SpringMvcScaffold
end

require "thor/actions"
require "thor/group"
require 'active_support/inflector'
require 'yaml'

require 'springmvc-scaffold/runner'
require 'springmvc-scaffold/execution'
require 'springmvc-scaffold/configuration'
require 'springmvc-scaffold/downloader'
require 'springmvc-scaffold/generators/base'
