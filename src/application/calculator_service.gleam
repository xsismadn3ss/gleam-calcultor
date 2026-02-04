import domain/operation
import gleam/result
import infrastructure/console.{prompt}
import infrastructure/parser.{parse_number, parse_operation}
import infrastructure/presenter.{format_error, format_result}

/// Menú
pub const menu_entry = "Escribe una opción:
\r1. Sumar \t| 2. Restar \t| 3. Multiplicar \t| 4. Dividir"

pub fn run() {
  // obtener operación
  use operation <- result.try(
    get_operation()
    |> result.map_error(format_error),
  )
  // obtener primer operando
  use operand_1 <- result.try(
    get_operand("Ingresa el primer número: ")
    |> result.map_error(format_error),
  )
  // obtener segundo operando
  use operand_2 <- result.try(
    get_operand("Ingresa el segundo número: ")
    |> result.map_error(format_error),
  )

  // crear tipo
  let calculation = operation.Calculation(operand_1, operand_2, operation)
  // obtener resultado
  use res <- result.try(
    operation.calculate(calculation)
    |> result.map_error(format_error),
  )

  Ok(format_result(res))
}

fn get_operation() {
  case prompt(menu_entry) {
    Ok(value) -> {
      case parse_operation(value) {
        Ok(operation) -> Ok(operation)
        Error(error) -> Error(error)
      }
    }
    Error(error) -> Error(error)
  }
}

fn get_operand(message: String) {
  // obtener numeros
  use num <- result.try(
    prompt(message)
    |> result.try(parse_number),
  )

  Ok(num)
}
