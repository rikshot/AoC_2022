defmodule Day2 do
  @behaviour Day

  defp score(choices) do
    case choices do
      ["A", "X"] -> 4
      ["A", "Y"] -> 8
      ["A", "Z"] -> 3
      ["B", "X"] -> 1
      ["B", "Y"] -> 5
      ["B", "Z"] -> 9
      ["C", "X"] -> 7
      ["C", "Y"] -> 2
      ["C", "Z"] -> 6
    end
  end

  defp strategy(choices) do
    case choices do
      ["A", "X"] -> 3
      ["A", "Y"] -> 4
      ["A", "Z"] -> 8
      ["B", "X"] -> 1
      ["B", "Y"] -> 5
      ["B", "Z"] -> 9
      ["C", "X"] -> 2
      ["C", "Y"] -> 6
      ["C", "Z"] -> 7
    end
  end

  def part1(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn round ->
      round
      |> String.split(" ")
      |> score
    end)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn round ->
      round
      |> String.split(" ")
      |> strategy
    end)
    |> Enum.sum()
  end
end
