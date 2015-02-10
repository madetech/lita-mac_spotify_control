Gem::Specification.new do |spec|
  spec.name          = "lita-mac_spotify_control"
  spec.version       = '0.0.1'
  spec.authors       = ['Seb Ashton']
  spec.email         = ['seb@madetech.co.uk']
  spec.description   = %q{TODO: Add a description}
  spec.summary       = %q{TODO: Add a summary}
  spec.homepage      = 'https://github.com/madebymade/lita-mac-spotify-control'
  spec.license       = 'New-BSD'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 4.2'
  spec.add_runtime_dependency 'rspotify', '1.11.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'capybara', '2.4.1'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec', '3.0.0'
  spec.add_development_dependency 'rspec-core', '3.0.3'
  spec.add_development_dependency 'rspec-expectations', '3.0.3'
  spec.add_development_dependency 'rspec-its', '1.0.1'
  spec.add_development_dependency 'rspec-support', '3.0.3'
  spec.add_development_dependency 'rspec_junit_formatter', '0.2.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'vcr', '2.9.2'
  spec.add_development_dependency 'webmock', '1.19.0'
end
