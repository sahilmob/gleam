fn square_of_sum_aux(n: Int) -> Int {
  let x = case n {
    1 -> 1
    i -> i + square_of_sum_aux(n - 1)
  }
  x
}

pub fn square_of_sum(n: Int) -> Int {
  let result = square_of_sum_aux(n)

  result * result
}

pub fn sum_of_squares(n: Int) -> Int {
  let x = case n {
    1 -> 1
    i -> i * i + sum_of_squares(n - 1)
  }

  x
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
