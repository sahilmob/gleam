import gleam/list

pub fn today(days: List(Int)) -> Int {
  case days {
    [today] -> today
    [today, ..] -> today
    _ -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [x, ..rest] ->
      case x {
        0 -> [0, ..rest]
        x -> [x + 1, ..rest]
      }
    [] -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case list.find(days, fn(x) { x == 0 }) {
    Error(_) -> False
    Ok(_) -> True
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [first, ..rest] -> first + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  list.count(days, fn(x) { x >= 5 })
}
