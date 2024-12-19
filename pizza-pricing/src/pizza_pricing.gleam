// TODO: please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(p) ->
      case p {
        Margherita -> 8
        Caprese -> 10
        Formaggio -> 11
        ExtraToppings(x) ->
          case x {
            Margherita -> 10
            Caprese -> 12
            Formaggio -> 13
            ExtraToppings(_) -> 2
            ExtraSauce(_) -> 1
          }
        ExtraSauce(_) -> 1
      }
    ExtraToppings(p) ->
      case p {
        Margherita -> 9
        Caprese -> 11
        Formaggio -> 12
        ExtraToppings(_) -> 4
        ExtraSauce(x) ->
          case x {
            Margherita -> 10
            Caprese -> 12
            Formaggio -> 13
            ExtraToppings(_) -> 2
            ExtraSauce(_) -> 1
          }
      }
  }
}

fn calculate_order_price(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [p, ..rest] -> {
      let x = acc + pizza_price(p)
      calculate_order_price(rest, x)
    }
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case order {
    [_] -> calculate_order_price(order, 3)
    [_, _] -> calculate_order_price(order, 2)
    _ -> calculate_order_price(order, 0)
  }
}
