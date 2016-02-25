defmodule Menu.Solver do
  alias Menu.Item
  alias Menu.Helpers

  def solve([target | [items]]) do
    solve(target, items)
  end

  def solve(target, items) do
    combinations(Item.with_price(items), target)
      |> Enum.filter(&(total_price_matches? &1, target))
  end

  def combinations(items, target) do
    max = max_possible_items(items, target)
    Helpers.combinations_up_to(max, items) |> Enum.uniq
  end

  def max_possible_items(items, target) do
    min_price = Item.min_price(items)
    trunc(target / min_price)
  end

  def total_price_matches?(items, target) do
    Item.total_price(items) == target
  end
end
