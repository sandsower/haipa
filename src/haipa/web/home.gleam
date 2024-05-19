import haipa/web.{type Context}
import haipa/pages
import haipa/pages/layout
import haipa/models.{Document}
import gleam/http.{Get}
import wisp.{type Request, type Response}

pub fn render_index(req: Request, ctx: Context) -> Response {
  use <- wisp.require_method(req, Get)
  pages.home(Document(""))
  |> layout.render(layout.Props(
    title: "Convert",
    ctx: ctx,
    req: req,
  ))
  |> web.render(200)
}

