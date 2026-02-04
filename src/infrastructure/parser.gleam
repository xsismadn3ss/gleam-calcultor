import domain/operation.{
  type CalculatorError, type Operation, Add, Divide, InvalidInput, Multiply,
  Subtract,
}
import gleam/int

/// Parse un opción a un tipo Operation
pub fn parse_operation(input: String) -> Result(Operation, CalculatorError) {
  case input {
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
  let result = int.parse(input)

  case result {
    Ok(value) -> Ok(value)
    _ -> Error(InvalidInput("El texto no es un número"))
  }
}
