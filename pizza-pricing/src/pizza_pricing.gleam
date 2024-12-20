// TODO: please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

fn pizza_price_loop(pizza: Pizza, price: Int) {
  case pizza {
    Margherita -> 7 + price
    Caprese -> 9 + price
    Formaggio -> 10 + price
    ExtraSauce(p) -> pizza_price_loop(p, 1 + price)
    ExtraToppings(p) -> pizza_price_loop(p, 2 + price)
  }
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_loop(pizza, 0)
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
