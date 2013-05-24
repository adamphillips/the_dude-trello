# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','the_dude-trello','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'the_dude-trello'
  s.version = TheDude::Trello::VERSION
  s.author = 'Adam Phillips'
  s.email = 'adam@29ways.co.uk'
  s.homepage = 'http://github.com/adamphillips/the_dude-trello'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Powers up The Dude with trello integration'
# Add your other files here if you make them
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.add_development_dependency('rake')
  s.add_runtime_dependency('the_dude')
  s.add_runtime_dependency('ruby-trello', '>=1')
end
