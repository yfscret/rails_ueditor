# frozen_string_literal: true

require_relative "lib/rails_ueditor/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_ueditor"
  spec.version       = RailsUeditor::VERSION
  spec.authors       = ["Rushboy"]
  spec.email         = ["yfscret@sina.com"]

  spec.summary       = "国内最好用的富文本UEditor"
  spec.description   = "尝试了很多富文本编辑器，没有个一个特别满意，尤其在图片编辑，回车，开头空两格等功能上，国外的富文本编辑器还是有各种问题，本土化不行，因此搞了这个很本土化的UEditor来用"
  spec.homepage      = "https://github.com/yfscret/rails_ueditor.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/yfscret/rails_ueditor.git"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yfscret/rails_ueditor.git"
  spec.metadata["changelog_uri"] = "https://github.com/yfscret/rails_ueditor.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
