$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'bsmart'
require 'aruba/cucumber'

if RUBY_PLATFORM == 'java'
  Before do @aruba_timeout_seconds = 10 end
end
