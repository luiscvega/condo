require_relative "shotgun"

Cuba.plugin Shield::Helpers
Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_enginge] = "erb"

Cuba.use Rack::Session::Cookie, secret: ENV["SESSION_SECRET"]
Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer
Cuba.use Rack::Static,
  urls: ["/js", "/css"],
  root: "public"

Cuba.define do
  on "templates" do
    run TemplateRoutes
  end

  on "login" do
    on post do
      data = req.body.read.dup
      json = JSON.parse(data) if data

      if json && login(Admin, json["email"], json["password"])
        res.status = 200
        res.write({message: "Successfully logged in!"}.to_json)
      else
        res.status = 401
        res.write({message: "Incorrect login details."}.to_json)
      end
    end
  end

  # on authenticated(Admin) do
  #   run AdminRoutes
  # end

  # on authenticated(Tenant) do
  #   run TenantRoutes
  # end

  on root do
    res.write view("index")
  end
end
