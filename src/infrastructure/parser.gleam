import domain/operation.{
  type CalculatorError, type Operation, Add, Divide, InvalidInput, Multiply,
  Subtract,
}
import gleam/int
import gleam/string

/// Parse un opción a un tipo Operation
pub fn parse_operation(input: String) -> Result(Operation, CalculatorError) {
  case string.trim(input) {
    "1" -> Ok(Add)
    "2" -> Ok(Subtract)
    "3" -> Ok(Multiply)
    "4" -> Ok(Divide)
    _ -> Error(InvalidInput("Operación no válida"))
  }
}

/// Parsea un número de string a entero
pub fn parse_number(input: String) -> Result(Int, CalculatorError) {
  // convertir string a entero
  let result = string.trim(input) |> int.parse

  case result {
    Ok(value) -> Ok(value)
    _ -> Error(InvalidInput("El texto no es un número"))
  }
}
