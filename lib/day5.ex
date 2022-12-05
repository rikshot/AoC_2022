defmodule Day5 do
  @behaviour Day

  @stack_parser ~r/(?:\[(.)\]|   ) ?/
  @command_parser ~r/move (\d+) from (\d+) to (\d+)/

  defp parse(input) do
    [stacks, commands] = input |> String.split("\n\n")

    stacks =
      stacks
      |> String.split("\n")
      |> Enum.reverse()
      |> tl()
      |> Enum.map(fn row ->
        Regex.scan(@stack_parser, row, capture: :all_but_first)
      end)

    width = Enum.count(Enum.at(stacks, 0))

    stacks =
      stacks
      |> Enum.reduce(1..width |> Enum.map(fn _ -> [] end), fn row, stacks ->
        row
        |> Enum.with_index()
        |> Enum.reduce(stacks, fn {slot, index}, stacks ->
          List.update_at(stacks, index, fn stack ->
            case slot do
              [] -> stack
              char -> [char | stack] |> List.flatten()
            end
          end)
        end)
      end)

    commands =
      commands
      |> String.split("\n")
      |> Enum.map(fn command ->
        Regex.scan(@command_parser, command, capture: :all_but_first)
        |> List.flatten()
        |> Enum.map(&String.to_integer/1)
      end)

    {stacks, commands}
  end

  defp execute({stacks, commands}, reverse \\ true) do
    commands
    |> Enum.reduce(stacks, fn [count, from, to], stacks ->
      {moving, remaining} = Enum.at(stacks, from - 1) |> Enum.split(count)
      stacks = List.replace_at(stacks, from - 1, remaining)
      moving = if reverse, do: moving |> Enum.reverse(), else: moving
      List.replace_at(stacks, to - 1, moving ++ Enum.at(stacks, to - 1))
    end)
  end

  @spec part1(binary) :: binary
  def part1(input) do
    input |> parse |> execute |> Enum.map(fn [first | _] -> first end) |> Enum.join()
  end

  def part2(input) do
    input |> parse |> execute(false) |> Enum.map(fn [first | _] -> first end) |> Enum.join()
  end
end
