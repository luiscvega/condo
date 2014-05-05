require_relative "shotgun"

Cuba.use Rack::Static,
  urls: ["/js", "/css"],
  root: "public"

Cuba.plugin Cuba::Mote

Cuba.define do
  on root do
    render "index", message: "Hello World!"
  end
end
