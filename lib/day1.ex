defmodule Day1 do
  @behaviour Day

  defp calories(input) do
    input
    |> String.split("\n\n")
    |> Enum.map(fn elf ->
      elf
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum()
    end)
    |> Enum.sort(:desc)
  end

  def part1(input) do
    input |> calories() |> hd()
  end

  def part2(input) do
    input |> calories() |> Enum.take(3) |> Enum.sum()
  end
end
