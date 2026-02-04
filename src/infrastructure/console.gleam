import domain/operation.{type CalculatorError, InvalidInput}
import gleam/io
import gleam/yielder
import stdin

/// Lee una linea de entrada del usuario
pub fn read_line() -> Result(String, CalculatorError) {
  let result = stdin.read_lines() |> yielder.first

  case result {
    Ok(line) -> Ok(line)
    _ -> Error(InvalidInput("No se pudo leer la línea"))
  }
}

/// Pide una entrada al usuario
///
/// Escribe un mensaje en consola y espera una entrada del usuario
pub fn prompt(message: String) -> Result(String, CalculatorError) {
  io.println(message)
  let result = stdin.read_lines() |> yielder.first

  case result {
    Ok(line) -> Ok(line)
    _ -> Error(InvalidInput("No se pudo leer la línea"))
  }
}
