import gleam/float
import gleam/list
import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case left {
    Celsius(l) ->
      case right {
        Celsius(r) -> float.compare(l, r)
        Fahrenheit(r) -> float.compare(l, fahrenheit_to_celsius(r))
      }
    Fahrenheit(l) ->
      case right {
        Celsius(r) -> float.compare(fahrenheit_to_celsius(l), r)
        Fahrenheit(r) -> float.compare(l, r)
      }
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  cities
  |> list.sort(fn(c1, c2) {
    compare_temperature(c1.temperature, c2.temperature)
  })
}
