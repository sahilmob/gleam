// Please define the expected_minutes_in_oven function
pub fn expected_minutes_in_oven() -> Int {
  40
}

// Please define the remaining_minutes_in_oven function
pub fn remaining_minutes_in_oven(time_in_oven: Int) {
  expected_minutes_in_oven() - time_in_oven
}

// Please define the preparation_time_in_minutes function
pub fn preparation_time_in_minutes(n_layers: Int) -> Int {
  n_layers * 2
}

// Please define the total_time_in_minutes function
pub fn total_time_in_minutes(n_layers: Int, time_in_oven: Int) -> Int {
  let preparation_time = preparation_time_in_minutes(n_layers)
  preparation_time + time_in_oven
}

// Please define the alarm function
pub fn alarm() {
  "Ding!"
}
