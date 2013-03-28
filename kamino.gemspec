require File.join([File.dirname(__FILE__),'lib','kamino','version.rb'])

Gem::Specification.new do |s|
  s.name        = "kamino"
  s.version     = Kamino::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ho-Sheng Hsiao"]
  s.email       = ["hosh@opscode.com"]
  s.homepage    = "http://github.com/hosh/kamino"
  s.summary     = "Wrap your app in a virtual machine for development work."
  s.description = "Clone your development stack. Develop in a sandbox. Version your operating system dependencies"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "kamino"

  s.add_dependency "thor"

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("{bin,lib, templates}/**/*") + %w(LICENSE README.md)
  s.executables  = ['kamino']
  s.require_path = 'lib'
end
