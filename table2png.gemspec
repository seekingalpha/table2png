# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "table2png"
  spec.version       = '0.0.2'
  spec.authors       = ["Maiz Lulkin"]
  spec.email         = ["maiz@lulk.in"]
  spec.description   = %q{Generates a png based on an HTML table}
  spec.summary       = %q{Generates a png based on an HTML table}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~>2.14"

  spec.add_runtime_dependency 'chunky_png'
  spec.add_runtime_dependency 'imgkit', '1.4.1'
end
