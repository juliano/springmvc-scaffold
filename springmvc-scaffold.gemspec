# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "springmvc-scaffold"
  s.version     = "1.0.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Juliano Alves"]
  s.email       = "von.juliano@gmail.com"
  s.homepage    = "http://github.com/juliano/springmvc-scaffold"
  s.summary     = "Spring MVC Scaffold."
  s.description = "Spring MVC scaffold extension to make it easier configuring new projects and plugins."
  s.post_install_message = "Thank you for installing springmvc-scaffold. Please read http://github.com/juliano/springmvc-scaffold/blob/master/README.textile for more information."
  
  s.add_dependency('thor', '0.19.1')
  s.add_dependency('activesupport', "4.1.8")
  s.add_dependency('rake', '10.1.0')

  s.add_development_dependency('rspec', '3.1.0')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
