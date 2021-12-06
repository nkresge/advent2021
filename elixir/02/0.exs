defmodule Solution do
  @moves %{
   forward: [1, 0],
   backward: [-1, 0],
   up: [0, -1],
   down: [0, 1],
  }

  def main do
    IO.stream(:stdio, :line)
    |> Stream.filter(fn s -> s != "" end)
    |> Stream.map(&String.slice(&1, 0..-2))
    |> Stream.map(&String.split(&1))
    |> Stream.map(fn([dir, mag]) -> Enum.map(@moves[String.to_atom(dir)], &(String.to_integer(mag) * &1)) end)
    |> Stream.scan([0, 0], fn
      [dx, dy], [x, y] -> [x + dx, y + dy]
    end)
    |> Enum.at(-1)
    |> Enum.product
    |> IO.inspect()
  end
end

Solution.main()
