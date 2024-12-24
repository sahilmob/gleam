import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(e) = problem
  e
}

pub fn remove_team_prefix(team: String) -> String {
  let assert [_, ..rest] = string.split(team, " ")
  string.join(rest, " ")
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert [region, ..rest] = string.split(combined, ",")
  let assert [name] = rest

  #(region, remove_team_prefix(name))
}
