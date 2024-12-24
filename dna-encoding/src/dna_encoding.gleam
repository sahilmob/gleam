import gleam/int
import gleam/list
import gleam/order

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0
    Cytosine -> 1
    Guanine -> 2
    Thymine -> 3
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0 -> Ok(Adenine)
    1 -> Ok(Cytosine)
    2 -> Ok(Guanine)
    3 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

fn encode_loop(dna: List(Nucleotide), arr: BitArray) -> BitArray {
  case dna {
    [n, ..rest] ->
      case int.compare(list.length(rest), 0) {
        order.Gt -> encode_loop(rest, <<arr:bits, encode_nucleotide(n):2>>)
        _ -> <<arr:bits, encode_nucleotide(n):2>>
      }
    [] -> arr
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  encode_loop(dna, <<>>)
}

fn decode_loop(
  dna: BitArray,
  arr: List(Nucleotide),
) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<value:2, rest:bits>> ->
      case decode_nucleotide(value) {
        Ok(v) -> decode_loop(rest, list.append(arr, [v]))
        Error(_) -> Ok(arr)
      }
    <<_:1>> -> Error(Nil)
    _ ->
      case int.compare(list.length(arr), 0) {
        order.Gt -> Ok(arr)
        _ -> Error(Nil)
      }
  }
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  decode_loop(dna, [])
}
