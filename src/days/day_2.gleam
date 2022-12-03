import gleam/string
import gleam/list
import gleam/int

fn score(choices: List(String)) -> Int {
  case choices {
    ["A", "X"] -> 4
    ["A", "Y"] -> 8
    ["A", "Z"] -> 3
    ["B", "X"] -> 1
    ["B", "Y"] -> 5
    ["B", "Z"] -> 9
    ["C", "X"] -> 7
    ["C", "Y"] -> 2
    ["C", "Z"] -> 6
  }
}

fn strategy(choices: List(String)) -> Int {
  case choices {
    ["A", "X"] -> 3
    ["A", "Y"] -> 4
    ["A", "Z"] -> 8
    ["B", "X"] -> 1
    ["B", "Y"] -> 5
    ["B", "Z"] -> 9
    ["C", "X"] -> 2
    ["C", "Y"] -> 6
    ["C", "Z"] -> 7
  }
}

pub fn pt_1(input: String) -> Int {
  input
  |> string.split("\n")
  |> list.map(fn(round) {
    round
    |> string.split(" ")
    |> score
  })
  |> int.sum
}

pub fn pt_2(input: String) -> Int {
  input
  |> string.split("\n")
  |> list.map(fn(round) {
    round
    |> string.split(" ")
    |> strategy
  })
  |> int.sum
}
