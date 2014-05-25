ROOT_DIR = File.expand_path(File.dirname(__FILE__))

if ENV["RACK_ENV"] == "development"
  # Need to load Dotenv before as early as possible
  require "dotenv"
  Dotenv.load
end

require "cuba"
require "cuba/contrib"
require "cuba/render"
require "slim"
require "ohm"
require "ohm/contrib"
require "shield"
require "puma"
require "interactor"
require "rack/protection"
require "pry"

Dir["./models/**/*.rb"].each { |file| require file }
Dir["./routes/**/*.rb"].each { |route| require route }
