import gleam/yielder

pub type InputError {
  NotAnInteger(String)
  NotInputRead
}

pub fn get_input(iterable) -> Result(String, InputError) {
  let input = yielder.first(iterable)
  case input {
    Ok(text) -> Ok(text)
    _ -> Error(NotInputRead)
  }
}
