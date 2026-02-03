import gleam/io
import gleam/yielder
import stdin
import utils/operation_handler.{handle_operation}

pub fn main() -> Nil {
  io.println(
    "Escribe una opción:
    1. Sumar \t2. Restar \t3. Multiplicar \t4. Dividir",
  )

  // Leer solo UNA línea para la opción
  let option_line = stdin.read_lines() |> yielder.first()

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
