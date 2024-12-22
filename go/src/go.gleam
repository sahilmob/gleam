import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  Ok(game)
  |> result.try(rule1)
  |> result.map(rule2)
  |> result.try(rule3)
  |> result.try(rule4)
  |> fn(g) {
    case g {
      Ok(g) if g.player == White -> Game(..g, player: Black)
      Ok(g) if g.player == Black -> Game(..g, player: White)
      Ok(g) -> g
      Error(msg) -> Game(..game, error: msg)
    }
  }
}
