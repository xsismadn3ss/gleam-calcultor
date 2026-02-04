import application/calculator_service
import gleam/io
import utils/time_elapsed.{log_time_elapsed}

pub fn main() -> Nil {
  use <- log_time_elapsed

  let result = calculator_service.run()
  case result {
    Ok(value) -> io.println(value)
    Error(error) -> io.println(error)
  }

  io.println("Proyecto finalizado.")
  Nil
}
