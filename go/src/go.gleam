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
  game
  |> rule1
  |> fn(r) {
    case r {
      Ok(g) -> g
      Error(msg) -> Game(..game, error: msg)
    }
  }
  |> rule2
  |> rule3
  |> fn(r) {
    case r {
      Ok(g) -> g
      Error(msg) -> Game(..game, error: msg)
    }
  }
  |> rule4
  |> fn(r) {
    case r {
      Ok(g) if g.error == "You can't put a stone on top of another stone" -> g
      Ok(g) if g.error == "Cannot place a stone with no liberties" -> g
      Ok(g) if g.player == White -> Game(..g, player: Black)
      Ok(g) if g.player == Black -> Game(..g, player: White)
      Ok(g) -> g
      Error(msg) -> Game(..game, error: msg)
    }
  }
}
