defmodule Mix.Tasks.Solve do
  use Mix.Task

  @impl Mix.Task
  def run([day]) do
    IO.puts("Day #{day}:")

    case :code.ensure_loaded(String.to_atom("Elixir.Day#{day}")) do
      {:module, module} ->
        {:ok, input} = File.read("input/day_#{day}.txt")
        IO.puts("\tPart 1: #{apply(module, String.to_atom("part1"), [input])}")
        IO.puts("\tPart 2: #{apply(module, String.to_atom("part2"), [input])}\n")

      _ ->
        IO.puts("\tMissing day #{day}\n")
    end
  end

  def run([]) do
    1..24
    |> Enum.map(fn day ->
      run([day])
    end)
  end
end
