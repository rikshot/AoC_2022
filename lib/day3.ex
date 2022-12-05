defmodule Day3 do
  @behaviour Day

  defp priorities(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn rucksack ->
      rucksack
      |> String.to_charlist()
      |> Enum.map(fn priority ->
        case priority - 96 do
          priority when priority >= 1 -> priority
          priority -> priority + 32 + 26
        end
      end)
    end)
  end

  def part1(input) do
    priorities(input)
    |> Enum.map(fn rucksack ->
      {a, b} =
        rucksack
        |> Enum.split(div(Enum.count(rucksack), 2))

      MapSet.intersection(MapSet.new(a), MapSet.new(b))
      |> MapSet.to_list()
    end)
    |> List.flatten()
    |> Enum.sum()
  end

  def part2(input) do
    priorities(input)
    |> Enum.chunk_every(3)
    |> Enum.map(fn group ->
      [a, b, c] =
        group
        |> Enum.map(&MapSet.new/1)

      MapSet.intersection(a, b)
      |> MapSet.intersection(c)
      |> MapSet.to_list()
    end)
    |> List.flatten()
    |> Enum.sum()
  end
end
