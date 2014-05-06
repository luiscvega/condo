ENV['RACK_ENV'] = "test"
require "minitest/autorun"
require "rack/test"

require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new

require_relative "../app"
