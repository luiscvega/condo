require_relative "../spec_helper"

include Rack::Test::Methods

def app
  Cuba.app
end

describe "Testing" do
  it "says hello" do
    get "/"

    last_response.body.must_include "Hello World!"
  end
end