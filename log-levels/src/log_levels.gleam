import gleam/string

pub fn message(log_line: String) -> String {
  let x = case log_line {
    "[ERROR]:" <> rest -> string.trim(rest)
    "[WARNING]:" <> rest -> string.trim(rest)
    "[INFO]:" <> rest -> string.trim(rest)
    _ -> log_line
  }
  x
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> _ -> "info"
    "[WARNING]:" <> _ -> "warning"
    _ -> "error"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " " <> "(" <> log_level(log_line) <> ")"
}
