require 'rubygems'
require 'rake/gempackagetask'

GEM = "merb-gen"
VERSION = "0.9.4"
AUTHOR = "Jonas Nicklas"
EMAIL = "jonas.nicklas@gmail.com"
HOMEPAGE = "http://www.merbivore.com"
SUMMARY = "Merb More: Merb's Application and Plugin Generators"

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.bindir = "bin"
  s.executables = %w( merb-gen )

  # Uncomment this to add a dependency
  s.add_dependency "merb-core", ">= 0.9.4"
  s.add_dependency "templater", ">= 0.1"

  s.require_path = 'lib'
  s.autorequire = GEM
  s.files = %w(LICENSE README Rakefile TODO) + Dir.glob("{lib,bin,spec,templates}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

install_home = ENV['GEM_HOME'] ? "-i #{ENV['GEM_HOME']}" : ""

namespace :jruby do
  task :install do
    sh %{sudo jruby -S gem install #{install_home} pkg/#{GEM}-#{VERSION} --no-update-sources}
  end
end

task :install => [:package] do
  sh %{sudo gem install #{install_home} pkg/#{GEM}-#{VERSION} --no-update-sources}
end
