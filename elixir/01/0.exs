defmodule Solution do
  def main do
    IO.stream(:stdio, :line)
    |> Stream.filter(fn s -> s != "" end)
    |> Stream.map(&String.slice(&1, 0..-2))
    |> Stream.map(&String.to_integer(&1))
    |> Stream.scan({0, 10_000_000}, fn
      curr, {acc, last} when curr > last -> {acc + 1, curr}
      curr, {acc, _} -> {acc, curr}
    end)
    |> Enum.at(-1)
    |> IO.inspect()
  end
end

Solution.main()
