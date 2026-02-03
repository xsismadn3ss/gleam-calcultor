import gleam/int
import gleam/io
import gleam/result
import gleam/string
import stdin
import utils/arithmetics
import utils/input.{type InputError, NotAnInteger, NotInputRead, get_input}

fn get_operator() -> Result(arithmetics.PairInput, InputError) {
  io.println("Escribe el primer número:")
  use text1 <- result.try(stdin.read_lines() |> get_input)

  use a <- result.try(
    int.parse(string.trim(text1))
    |> result.replace_error(NotAnInteger(text1)),
  )

  io.println("Escribe el segundo número:")
  use text2 <- result.try(stdin.read_lines() |> get_input)

  use b <- result.try(
    int.parse(string.trim(text2))
    |> result.replace_error(NotAnInteger(text2)),
  )

  Ok(arithmetics.PairInput(a: a, b: b))
}

fn get_result(
  operation: fn(arithmetics.PairInput) -> Result(Int, String),
) -> Result(String, String) {
  case get_operator() {
    Ok(input) -> {
      case operation(input) {
        Ok(result) -> Ok(int.to_string(result))
        Error(msg) -> Ok(msg)
      }
    }
    Error(NotInputRead) -> Error("No se pudo leer la entrada")
    Error(NotAnInteger(msg)) ->
      Error("'" <> string.trim(msg) <> "' no es un número válido")
  }
}

pub type OperationError {
  OperationError(String)
}

/// Manejar operación
/// Espera un opción valida y devuelve el resultado de la operación
/// Se encarga de hacer toda la validación y manejo de errores
pub fn handle_operation(option: String) -> Result(String, OperationError) {
  let option = string.trim(option)

  case option {
    "1" -> {
      get_result(fn(input) { Ok(arithmetics.sumar(input)) })
      |> result.map_error(fn(error_msg) { OperationError(error_msg) })
    }
    "2" -> {
      get_result(fn(input) { Ok(arithmetics.restar(input)) })
      |> result.map_error(fn(error_msg) { OperationError(error_msg) })
    }
    "3" -> {
      get_result(fn(input) { Ok(arithmetics.multiplicar(input)) })
      |> result.map_error(fn(error_msg) { OperationError(error_msg) })
    }
    "4" -> {
      get_result(fn(input) { arithmetics.dividir(input) })
      |> result.map_error(fn(error_msg) { OperationError(error_msg) })
    }
    _ -> Error(OperationError(option <> " no es una opción válida"))
  }
}
