import nakai/attr.{class, id}
import nakai/html.{aside, button, div, form, main, nav, section, textarea_text}

pub fn render() -> html.Node {
  section(
    [
      class(
        "w-full h-[50vh] md:h-auto px-5 pt-4 lg:px-6 pb-32 md:pb-36 whitespace-pre-line overflow-y-auto border-l border-l-stone-800",
      ),
      id("preview"),
    ],
    [],
  )
}
