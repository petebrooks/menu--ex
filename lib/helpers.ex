defmodule Helpers do
  def combinations_up_to(n, list) do
    Enum.flat_map(1..n, &(combinations(&1, list)))
  end

  def combinations(0, _), do: [[]]

  def combinations(_, []), do: []

  def combinations(n, [head | tail] = list) do
    (for x <- combinations(n - 1, list), do: [head | x]) ++ combinations(n, tail)
  end
end
