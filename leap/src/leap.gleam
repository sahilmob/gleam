pub fn is_leap_year(year: Int) -> Bool {
  case year {
    i if i % 4 == 0 && i % 100 != 0 -> True
    i if i % 100 == 0 && i % 400 == 0 -> True
    _ -> False
  }
}
