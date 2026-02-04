/// Tipos de operación
pub type Operation {
  Add
  Subtract
  Multiply
  Divide
}

/// Errores de dominio
pub type CalculatorError {
  DivisionByZero
  InvalidOperation
  InvalidInput(String)
}

/// Representa una operación matemática
pub type Calculation {
  Calculation(operand_a: Int, operand_b: Int, operation: Operation)
}

/// Reglas de negocio del dominio
///
/// Calcular resultado en base a la operación y operandos dados.
pub fn calculate(calculation: Calculation) -> Result(Int, CalculatorError) {
  case calculation.operation {
    Add -> Ok(calculation.operand_a + calculation.operand_b)
    Subtract -> Ok(calculation.operand_a - calculation.operand_b)
    Multiply -> Ok(calculation.operand_a * calculation.operand_b)
    Divide -> {
      case calculation.operand_b {
        0 -> Error(DivisionByZero)
        _ -> Ok(calculation.operand_a / calculation.operand_b)
      }
    }
  }
}
