defmodule Menu.Solver do
  alias Menu.Item
  alias Menu.Helpers

  def solve(target, items) do
    combinations(items, target) |> Enum.filter(&(total_price_matches? &1, target))
  end

  def combinations(items, target) do
    min_price = Item.min_price(items)
    max_count = trunc(target / min_price)
    Helpers.combinations_up_to(max_count, items)
  end

  def total_price_matches?(items, target) do
    Item.total_price(items) == target
  end
end
