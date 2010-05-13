# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "verb"
  s.version     = "0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nick Chapman"]
  s.email       = ["nchapman@gmail.com"]
  s.homepage    = "http://github.com/nchapman/verb"
  s.summary     = "Serve RHTML in Rack"
  s.description = "Verb is Rack middleware that serves RHTML files."
 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.files        = ["lib/verb.rb"]
  s.require_path = "lib"
end
