import nakai/attr
import nakai/html
import haipa/web.{type Context}
import wisp

pub type Props {
  Props(title: String, ctx: Context, req: wisp.Request)
}

const description = "Haipa is a simple and fast HTML to nakai converter."

pub fn header(title: String) -> html.Node {
  html.Head([
    html.meta([attr.charset("utf-8")]),
    html.meta([
      attr.name("viewport"),
      attr.content("width=device-width, initial-scale=1"),
    ]),
    html.meta([attr.name("theme-color"), attr.content("#1C1918")]),
    html.link([attr.rel("icon"), attr.href("/assets/images/favicon.png")]),
    // OG tags
    html.meta([attr.property("og:title"), attr.content(title)]),
    html.meta([attr.property("og:description"), attr.content(description)]),
    html.meta([attr.property("og:type"), attr.content("website")]),
    // styles and scripts
    html.link([
      attr.rel("stylesheet"),
      attr.href(
        "https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css",
      ),
    ]),
    html.link([attr.rel("stylesheet"), attr.href("/assets/css/styles.css")]),
    html.Element("script", [attr.src("/assets/js/htmx.min.js")], []),
    html.title(title),
  ])
}

fn nav() -> html.Node {
  html.nav(
    [
      attr.class(
        "w-full fixed top-0 left-0 right-0 bg-stone-900/70 backdrop-blur-lg flex justify-between items-center border-b border-b-stone-800 py-4 lg:py-5 px-5 lg:px-8 z-10",
      ),
    ],
    [
      html.a_text(
        [
          attr.class("text-yellow-400 font-bold text-xl px-2 py-1"),
          attr.href("/"),
          attr.Attr("hx-boost", "true"),
          attr.Attr("hx-trigger", "keyup[event.key=='m'] from:body"),
        ],
        "Haipa",
      ),
      html.div([attr.class("flex items-center")], [
        html.a(
          [
            attr.href("https://github.com/sandsower/haipa"),
            attr.target("_blank"),
          ],
          [],
        ),
      ]),
    ],
  )
}

pub fn render(child: html.Node, props: Props) -> html.Node {
  let title = case props.title {
    "" -> "Haipa"
    title -> title
  }

  html.Fragment([
    header(title),
    html.Body(
      [
        attr.class("mt-[9vh]"),
        attr.id("main"),
        attr.Attr("hx-ext", "response-targets"),
        attr.Attr("hx-boost", "true"),
      ],
      [nav(), child],
    ),
  ])
}
