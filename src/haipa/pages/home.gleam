import gleam/list
import gleam/option.{type Option}
import haipa/pages/layout
import haipa/components/editor
import haipa/components/preview
import haipa/models.{type Document}
import nakai/attr.{class, id}
import nakai/html.{aside, button, div, form, main, nav, section, textarea_text}


fn header_component() -> html.Node {
  html.header([], [
    nav(
      [
        class(
          "w-full flex items-center justify-between py-3 px-4 lg:px-6 border-b-2 border-b-stone-800",
        ),
      ],
      [
        div([class("flex items-center gap-x-4")], [
          button(
            [
              class("text-yellow-400 text-2xl transition-all"),
              id("sidebar-toggle"),
              attr.title("Toggle sidebar"),
              attr.Attr("data-status", "closed"),
            ],
            [],
          ),
          button(
            [
              class("text-yellow-400 text-2xl transition-all lg:hidden"),
              id("palette-toggle"),
            ],
            [],
          ),
        ]),
      ],
    ),
  ])
}

fn button_component(text: String, attrs: List(attr.Attr)) -> html.Node {
  html.button(
    [
      class("bg-yellow-400 text-stone-900 text-lg transition-all p-2"),
      attr.title(text),
    ]
      |> list.append(attrs),
    [html.Text(text)],
  )
}

fn toolbar_component() -> html.Node {
  html.div(
    [
      class(
        "w-full flex items-center justify-between py-3 px-4 lg:px-6 border-b-2 border-b-stone-800 absolute bottom-0 left-0 z-10",
      ),
    ],
    [
      html.div([class("flex items-center gap-x-4")], [
        button_component("Transform HTML", []),
        button_component("Copy Nakai code", []),
        button_component("Reset HTML content", []),
      ]),
    ],
  )
}

pub fn page(document: Document) -> html.Node {
  html.Fragment([
    layout.header("Editor"),
    html.Body([class("md:h-screen flex overflow-hidden")], [
      // sidebar_component(document),
      main([class("pt-10 h-full w-full flex-grow md:flex md:flex-col")], [
        header_component(),
        div([], [
          main(
            [
              class(
                "h-screen w-full grid grid-cols-2 md:grid-cols-2 gap-4 md:gap-0",
              ),
            ],
            [editor.render(document), preview.render()],
          ),
        ]),
      ]),
      toolbar_component(),
      // div([id("keymaps"), class("hidden")], [
    //   html.Text(keybindings.as_json(bindings())),
    // ]),
    // keybindings.component(),
    // palette.component(PaletteProps(documents: documents)),
    ]),
  ])
}
