import nakai/attr.{class, id, name}
import nakai/html.{section, textarea_text}
import haipa/models.{type Document}

pub fn render(document: Document) -> html.Node {
  section([class("w-full h-[50vh] md:h-auto")], [
    textarea_text(
      [
        class(
          "h-full w-full bg-transparent text-yellow-400 resize-none whitespace-pre-line focus:outline-none px-5 pt-8 lg:px-6 pb-16 md:pb-36",
        ),
        id("editor"),
        name("editor"),
      ],
      document.content,
    ),
  ])
}
