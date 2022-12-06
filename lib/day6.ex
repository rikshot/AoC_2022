defmodule Day6 do
  @behaviour Day

  defp find_uniq(input, count) do
    input
    |> String.graphemes()
    |> Enum.chunk_every(count, 1)
    |> Enum.reduce_while(0, fn chunk, index ->
      if chunk |> Enum.uniq() == chunk, do: {:halt, index + count}, else: {:cont, index + 1}
    end)
  end

  def part1(input) do
    input |> find_uniq(4)
  end

  def part2(input) do
    input |> find_uniq(14)
  end
end
