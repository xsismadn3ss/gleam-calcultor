import gleam/float
import gleam/io
import gleam/time/timestamp

/// Imprime el tiempo transcurrido en segundos
/// Se puede utilizar para medir el tiempo de ejecución de una función
pub fn log_time_elapsed(callback: fn() -> Nil) {
  let start = timestamp.system_time() |> timestamp.to_unix_seconds
  callback()
  let end = timestamp.system_time() |> timestamp.to_unix_seconds
  let elapsed = end -. start |> float.to_string()
  io.println("Time elapsed: " <> elapsed <> " seconds")
}
