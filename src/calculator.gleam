import gleam/io
import stdin
import utils/input.{NotInputRead, get_input}
import utils/operation_handler.{OperationError, handle_operation}
import utils/time_elapsed.{log_time_elapsed}

pub fn main() -> Nil {
  use <- log_time_elapsed
  io.println(
    "Escribe una opción:
    \r1. Sumar \t| 2. Restar \t| 3. Multiplicar \t| 4. Dividir",
  )

  let option = stdin.read_lines() |> get_input
  case option {
    Ok(msg) -> {
      case handle_operation(msg) {
        Ok(value) -> io.println("Resultado: " <> value)
        Error(OperationError(error)) -> io.println("Error: " <> error)
      }
    }
    Error(NotInputRead) -> io.println("No se pudo leer la entrada")
  }

  io.println("Proyecto finalizado.")
  Nil
}
