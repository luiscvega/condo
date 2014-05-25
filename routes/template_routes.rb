class TemplateRoutes < Cuba
  define do
    Cuba::Render.setup(self)

    on get do
      on "index" do
        res.write partial("index")
      end

      on "login" do
        res.write partial("login")
      end
    end
  end
end
