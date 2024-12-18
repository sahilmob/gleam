// Please define the TreasureChest generic custom type
pub type TreasureChest(t) {
  TreasureChest(u: String, t: t)
}

// Please define the UnlockResult generic custom type
pub type UnlockResult(a) {
  Unlocked(a)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest {
    TreasureChest(u: u, t: treasure) if u == password -> Unlocked(treasure)
    _ -> WrongPassword
  }
}
