import domain/operation.{
  type CalculatorError, DivisionByZero, InvalidInput, InvalidOperation,
}
import gleam/int

pub fn format_result(result: Int) -> String {
  "Resultado: " <> int.to_string(result)
}

pub fn format_error(error: CalculatorError) -> String {
  case error {
    InvalidInput(msg) -> "Entrada inválida: " <> msg
    InvalidOperation -> "Operación inválida"
    DivisionByZero -> "División por cero"
  }
}
