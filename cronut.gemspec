# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cronut/version'

Gem::Specification.new do |spec|
  spec.name          = 'cronut'
  spec.version       = Cronut::VERSION
  spec.authors       = ['Josh McMillan']
  spec.email         = ['josh@joshmcmillan.co.uk']

  spec.summary       = 'A simple cron parser'
  spec.homepage      = 'https://github.com/mcmillan/cronut'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(/^(test|spec|features)\//)
  end

  spec.bindir        = 'bin'
  spec.executables   = ['cronut']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'rubocop', '~> 0.72'
end
