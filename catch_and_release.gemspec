require File.expand_path( "../lib/catch_and_release/version", __FILE__ )

Gem::Specification.new do |gem|

  gem.name                  = 'catch_and_release'
  gem.version               = CatchAndRelease::VERSION
  gem.platform              = Gem::Platform::RUBY
  gem.required_ruby_version = ">= 1.9.3"

  gem.summary       = 'Tools for testing standard inputs & outputs'
  gem.description   = %q{ Tools for testing standard inputs & outputs }
  gem.authors       = ["Steven Sloan"]
  gem.email         = "stevenosloan@gmail.com"
  gem.homepage      = "http://github.com/stevenosloan/catch_and_release"
  gem.license       = 'MIT'

  gem.files         = Dir["{lib}/**/*.rb"]
  gem.test_files    = Dir["spec/**/*.rb"]
  gem.require_path  = "lib"

end