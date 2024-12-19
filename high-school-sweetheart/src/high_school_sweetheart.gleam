import gleam/list
import gleam/string

pub fn first_letter(name: String) {
  name
  |> string.trim
  |> string.slice(0, 1)
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name
  |> string.split(" ")
  |> list.map(initial)
  |> fn(x) {
    case x {
      [f, l] -> {
        string.append(f, string.append(" ", l))
      }
      [] -> ""
      [_] -> ""
      [_, _, _, ..] -> ""
    }
  }
}

pub fn pair(full_name1: String, full_name2: String) {
  let x = initials(full_name1)
  let y = initials(full_name2)
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> x <> "  +  " <> y <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
