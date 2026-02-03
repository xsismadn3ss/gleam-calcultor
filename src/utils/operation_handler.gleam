import gleam/int
import gleam/io
import gleam/string
import gleam/yielder
import stdin
import utils/arithmetics

fn get_operator() -> Result(arithmetics.PairInput, String) {
  io.println("Escribe el primer número:")
  let num1 = stdin.read_lines() |> yielder.first()

  io.println("Escribe el segundo número")
  let num2 = stdin.read_lines() |> yielder.first()

  case num1{
    Ok(text1) -> {
      case num2 {
        Ok(text2) -> {
          let parsed1 = string.trim(text1) |> int.parse
          let parsed2 = string.trim(text2) |> int.parse

          case parsed1, parsed2 {
            Ok(a), Ok(b) -> Ok(arithmetics.PairInput(a: a, b: b))
            _, _ -> Error("Se requieren dos números válidos")
          }
        }
        _ -> Error("No se pudo leer la segunda entrada")
      }
    }
    _ -> Error("No se pudo leer la primera entrada")
  }
}

fn get_result(
  operation: fn(arithmetics.PairInput) -> Result(Int, String),
) -> String {
  case get_operator() {
    Ok(input) -> {
      case operation(input) {
        Ok(result) -> int.to_string(result)
        Error(msg) -> msg
      }
    }
    Error(msg) -> msg
  }
}

pub fn handle_operation(option: String) -> String {
  let option = string.trim(option)

  case option {
    "1" -> {
      get_result(fn(input) { Ok(arithmetics.sumar(input)) })
    }
    "2" -> {
      get_result(fn(input) { Ok(arithmetics.restar(input)) })
    }
    "3" -> {
      get_result(fn(input) { Ok(arithmetics.multiplicar(input)) })
    }
    "4" -> {
      get_result(fn(input) { arithmetics.dividir(input) })
    }
    _ -> "Opción no válida"
  }
}
