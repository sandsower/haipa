import gleam/http.{Post}
import gleam/io
import gleam/list
import gleam/result
import haipa/components/preview
import haipa/web.{type Context}
import wisp.{type Request, type Response}
import html_nakai_converter

pub fn handle_request(req: Request, _ctx: Context) -> Response {
  case req.method {
    Post -> {
      use formdata <- wisp.require_form(req)
      let result = {
        use body <- result.try(list.key_find(formdata.values, "editor"))
        Ok(body)
      }
      case result {
        Ok(body) -> {
          let res = html_nakai_converter.convert(body) 
          preview.render(res)
          |> web.render(200)
        }
        Error(_) -> wisp.bad_request()
      }
    }
    _ -> wisp.not_found()
  }
}
