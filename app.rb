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

Cuba.plugin Shield::Helpers
Cuba.plugin Cuba::Mote

Cuba.define do
  on "login" do
    on post do
      data = req.body.read.dup
      user = JSON.parse(data)

      if admin = Admin.authenticate(user["email"], user["password"])
        res.write("ok")
      else
        res.status = 401
        res.write({status: "failed"}.to_json)
      end
    end

    on get do
      res.write partial("login")
    end
  end

  on "admin" do
    run AdminRoutes
  end

  on "tenants" do
    run TenantRoutes
  end

  on root do
    res.write view("index")
  end
end
