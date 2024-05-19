import nakai/attr.{class, id, name}
import nakai/html.{section}

pub fn render(content: String) -> html.Node {
  section(
    [
      class(
        "w-full h-[50vh] md:h-auto px-5 pt-4 lg:px-6 pb-32 md:pb-36 whitespace-pre-line overflow-y-auto border-l border-l-stone-800",
      ),
      id("preview"),
      name("preview"),
    ],
    [html.Text(content)],
  )
}
