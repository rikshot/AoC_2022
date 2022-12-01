import gleam/string
import gleam/list
import gleam/int
import gleam/result

fn calories(input: String) -> List(Int) {
  input
  |> string.split("\n\n")
  |> list.map(fn(elf) {
    elf
    |> string.split("\n")
    |> list.map(int.parse)
    |> result.values()
    |> int.sum
  })
  |> list.sort(int.compare)
  |> list.reverse()
}

pub fn pt_1(input: String) -> Int {
  calories(input)
  |> list.first()
  |> result.unwrap(or: 0)
}

pub fn pt_2(input: String) -> Int {
  calories(input)
  |> list.take(3)
  |> int.sum()
}
