import gleam/int
import gleam/option.{type Option, None, Some}
import gleam/order

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(n) -> n
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 ->
      case int.compare(player.level, 9) {
        order.Gt -> Some(Player(..player, health: 100, mana: Some(100)))
        _ -> Some(Player(..player, health: 100, mana: None))
      }
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(v) ->
      case int.compare(v, cost) {
        order.Gt | order.Eq -> #(
          Player(..player, mana: Some(v - cost)),
          2 * cost,
        )
        order.Lt -> #(player, 0)
      }
    None -> #(Player(..player, health: int.max(player.health - cost, 0)), 0)
  }
}
