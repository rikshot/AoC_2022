import gleam/string
import gleam/list
import gleam/int
import gleam/result
import gleam/iterator
import gleam/set

fn ranges(input: String) -> List(List(List(Int))) {
  input
  |> string.split("\n")
  |> list.map(fn(pair) {
    pair
    |> string.split(",")
    |> list.map(fn(range) {
      range
      |> string.split("-")
      |> list.map(int.parse)
      |> result.values
    })
  })
}

pub fn pt_1(input: String) -> Int {
  input
  |> ranges
  |> list.map(fn(pair) {
    let [[a, b], [c, d]] = pair
    case a >= c && b <= d || c >= a && d <= b {
      True -> 1
      False -> 0
    }
  })
  |> int.sum
}

pub fn pt_2(input: String) -> Int {
  input
  |> ranges
  |> list.map(fn(pair) {
    let [[a, b], [c, d]] = pair
    let a =
      iterator.range(a, b)
      |> iterator.to_list
      |> set.from_list
    let b =
      iterator.range(c, d)
      |> iterator.to_list
      |> set.from_list

    case
      set.intersection(a, b)
      |> set.size >= 1
    {
      True -> 1
      False -> 0
    }
  })
  |> int.sum
}
