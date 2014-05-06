require_relative "shotgun"

if ENV["RACK_ENV"] != "test"
  Cuba.use Rack::Session::Cookie, secret: ENV["SESSION_SECRET"]
  Cuba.use Rack::Protection
  Cuba.use Rack::Protection::RemoteReferrer
end
Cuba.use Rack::Static,
  urls: ["/js", "/css"],
  root: "public"

Cuba.plugin Cuba::Mote

Cuba.define do
  on root do
    render "index", message: "Hello World!"
  end
end
