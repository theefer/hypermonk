source "https://rubygems.org"

gemspec

# zip dependency is a bit of a mess, this is a stopgap to resolve deps we need
gem 'rubyzip', '>= 1.0.0' # will load new rubyzip version
gem 'zip-zip' # will load compatibility for old rubyzip API.

# Note: we need our fixed fork of eeepub
gem "eeepub", :git => "git://github.com/theefer/eeepub.git", :branch => 'anglemort'
