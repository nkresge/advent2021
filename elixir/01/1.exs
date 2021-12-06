defmodule Solution do
  def main do
    m = 10_000_000

    IO.stream(:stdio, :line)
    |> Stream.filter(fn s -> s != "" end)
    |> Stream.map(&String.slice(&1, 0..-2))
    |> Stream.map(&String.to_integer(&1))
    |> Stream.scan({0, m, m, m}, fn
      curr, {acc, back2, back1, back0} when curr > back2 -> {acc + 1, back1, back0, curr}
      curr, {acc, _, back1, back0} -> {acc, back1, back0, curr}
    end)
    |> Enum.at(-1)
    |> IO.inspect()
  end
end

Solution.main()
