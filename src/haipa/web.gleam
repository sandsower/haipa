import nakai
import nakai/html
import wisp

pub type Context {
  Context(
    dist_directory: String,
  )
}

pub fn render(page: html.Node, code: Int) {
  page
  |> nakai.to_string_builder
  |> wisp.html_response(code)
}
