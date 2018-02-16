# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jekyll-any-theme"
  spec.version       = "0.1.2"
  spec.authors       = ["Alex Petrosh"]
  spec.email         = ["petrosh@users.noreply.github.com"]

  spec.summary       = %q{Jekyll any theme – Customizable Bootstrap 4}
  spec.description   = %q{Highly adaptable, generic theme focused in yaml schema creation}
  spec.homepage      = "https://tool-of-lore.github.io/jekyll-any-theme/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.6"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
