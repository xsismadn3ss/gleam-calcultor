pub type PairInput {
  PairInput(a: Int, b: Int)
}

pub fn sumar(input: PairInput) -> Int {
  input.a + input.b
}

pub fn restar(input: PairInput) -> Int {
  input.a - input.b
}

pub fn multiplicar(input: PairInput) -> Int {
  input.a * input.b
}

pub fn dividir(input: PairInput) -> Result(Int, String) {
  case input.b {
    0 -> Error("No se puede dividir por cero")
    _ -> Ok(input.a / input.b)
  }
}
