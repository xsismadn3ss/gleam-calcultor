import gleam/io
import gleam/yielder.{first}
import stdin
import utils/operation_handler.{handle_operation}

pub fn main() -> Nil {
  io.println(
    "Escribe una opción:
    \r1. Sumar \t| 2. Restar \t| 3. Multiplicar \t| 4. Dividir",
  )

  // Leer solo UNA línea para la opción
  let option_line = first(stdin.read_lines())

  case option_line {
    Ok(option) -> {
      let result = handle_operation(option)
      io.println("Resultado: " <> result)
    }
    _ -> {
      io.println("Opción inválida.")
    }
  }

  io.println("Proyecto finalizado.")
  Nil
}
