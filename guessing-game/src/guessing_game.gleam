pub fn reply(guess: Int) -> String {
  case guess {
    42 -> "Correct"
    i if i == 43 || i == 41 -> "So close"
    i if i < 41 -> "Too low"
    _ -> "Too high"
  }
}
