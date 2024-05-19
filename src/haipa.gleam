import gleam/erlang/os
import gleam/erlang/process
import gleam/int
import gleam/result
import haipa/router
import haipa/web.{Context}
import mist
import wisp

pub fn main() {
  wisp.configure_logger()

  let assert Ok(priv_directory) = wisp.priv_directory("haipa")

  let ctx = Context(dist_directory: priv_directory <> "/static/dist")

  let assert Ok(_) =
    router.handle_request(_, ctx)
    |> wisp.mist_handler(get_app_secret())
    |> mist.new
    |> mist.port(get_port())
    |> mist.start_http

  process.sleep_forever()
}

fn get_port() -> Int {
  os.get_env("PORT")
  |> result.then(int.parse)
  |> result.unwrap(8080)
}

fn get_app_secret() -> String {
  os.get_env("APP_SECRET")
  |> result.unwrap("")
}
