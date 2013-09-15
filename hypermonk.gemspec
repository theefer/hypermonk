# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'hypermonk/version'

spec = Gem::Specification.new do |s|
  s.name   = "hypermonk"
  s.version = Hypermonk::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Sébastien Cevey']
  s.email = ["seb@cine7.net"]
  s.summary = "A tool to compile textual documents into multiple output formats (EPUB, PDF, HTML, etc)"

  # s.add_development_dependency('rake')
  # s.add_development_dependency('minitest', '~> 2.1.0')
  # s.add_development_dependency('mocha', '~> 0.9.12')
  # s.add_development_dependency('rcov', '~> 0.9.9')

  s.add_dependency('eeepub', '~> 0.7.1')
  s.add_dependency('i18n')
  s.add_dependency('erubis')
  # s.add_dependency('hpricot')
  s.add_dependency('locale')
  s.add_dependency('nokogiri')
  # s.add_dependency('rake')

  # FIXME: refactor and move executables
  s.executables = ['hypermonk', 'hypermonk-import']
  s.files = Dir.glob("{lib}/**/*") + Dir.glob("{resources}/**/*")
end
