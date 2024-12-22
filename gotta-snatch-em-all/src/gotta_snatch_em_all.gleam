import gleam/list
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  let has_card = set.contains(collection, card)

  let new_set = set.insert(collection, card)
  #(has_card, new_set)
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let can_trade =
    my_card != their_card
    && set.contains(collection, my_card)
    && !set.contains(collection, their_card)
  collection
  |> set.insert(their_card)
  |> set.delete(my_card)
  |> fn(s) { #(can_trade, s) }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  let initial_set = case list.first(collections) {
    Ok(s) -> s
    Error(_) -> set.new()
  }

  set.from_list(collections)
  |> set.fold(initial_set, fn(acc, curr) { set.intersection(acc, curr) })
  |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  let initial_set = case list.first(collections) {
    Ok(s) -> s
    Error(_) -> set.new()
  }

  set.from_list(collections)
  |> set.fold(initial_set, fn(acc, curr) { set.union(acc, curr) })
  |> set.to_list
  |> list.length
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(fn(x) { string.starts_with(x, "Shiny ") })
}
