ROOT_DIR = File.expand_path(File.dirname(__FILE__))

require "cuba"
require "mote"
require "cuba/contrib"
require "ohm"
require "ohm/contrib"
require "shield"
require "puma"
require "interactor"
require "rack/protection"

Dir["./models/**/*.rb"].each { |file| require file }
