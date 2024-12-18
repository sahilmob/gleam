import gleam/list

pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  list.prepend(languages, language)
}

pub fn count_languages(languages: List(String)) -> Int {
  list.length(languages)
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  list.reverse(languages)
}

pub fn exciting_list(languages: List(String)) -> Bool {
  case languages {
    [lang1, ..] if lang1 == "Gleam" -> True
    [_, lang2, ..rest] if lang2 == "Gleam" ->
      case rest {
        [] -> True
        [_, ..nested_rest] ->
          case nested_rest {
            [] -> True
            _ -> False
          }
      }
    _ -> False
  }
}
