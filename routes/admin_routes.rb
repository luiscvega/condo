class AdminRoutes < Cuba
  define do
    on "login" do
      res.write({ hello: "my message" }.to_json)
    end
  end
end
