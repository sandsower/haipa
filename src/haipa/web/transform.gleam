import gleam/http.{Get}
import haipa/web.{type Context}
import wisp.{type Request, type Response}
import haipa/components/editor
import haipa/models.{Document}

pub fn handle_request(req: Request, _ctx: Context) -> Response {
  case req.method {
    Get -> {
      editor.render(Document(""))
      |> web.render(200)
    }
    _ -> wisp.not_found()
  }
}
