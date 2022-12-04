import gleam/string
import gleam/list
import gleam/int
import gleam/bit_string
import gleam/set

fn priorities(input: String) -> List(List(Int)) {
  input
  |> string.split("\n")
  |> list.map(fn(rucksack) {
    rucksack
    |> string.to_graphemes
    |> list.map(bit_string.from_string)
    |> list.map(fn(char) {
      let <<priority:8>> = char
      case priority - 96 {
        priority if priority >= 1 -> priority
        priority -> priority + 32 + 26
      }
    })
  })
}

pub fn pt_1(input: String) -> Int {
  priorities(input)
  |> list.map(fn(rucksack) {
    let #(a, b) =
      rucksack
      |> list.split(list.length(rucksack) / 2)
    set.intersection(set.from_list(a), set.from_list(b))
    |> set.to_list
  })
  |> list.flatten
  |> int.sum
}

pub fn pt_2(input: String) -> Int {
  priorities(input)
  |> list.sized_chunk(3)
  |> list.map(fn(group) {
    let [a, b, c] =
      group
      |> list.map(set.from_list)
    set.intersection(a, b)
    |> set.intersection(c)
    |> set.to_list
  })
  |> list.flatten
  |> int.sum
}
