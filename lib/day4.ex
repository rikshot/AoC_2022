defmodule Day4 do
  @behaviour Day

  defp ranges(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn pair ->
      pair
      |> String.split(",")
      |> Enum.map(fn range ->
        range
        |> String.split("-")
        |> Enum.map(&String.to_integer/1)
      end)
    end)
  end

  def part1(input) do
    input
    |> ranges
    |> Enum.map(fn [[a, b], [c, d]] ->
      if (a >= c && b <= d) || (c >= a && d <= b), do: 1, else: 0
    end)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> ranges
    |> Enum.map(fn [[a, b], [c, d]] ->
      if b >= c and d >= a, do: 1, else: 0
    end)
    |> Enum.sum()
  end
end
