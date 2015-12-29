defmodule Menu do
  def solve(filename) do
    [target, items] = parse(filename)
    combinations(items, target) |> Enum.filter(&(total_price_matches? &1, target))
  end

  def combinations(items, target) do
    min_price = Item.min_price(items)
    max_count = Kernel.trunc(target / min_price)
    Helpers.combinations_up_to(max_count, items)
  end

  def total_price_matches?(items, target) do
    Item.total_price(items) == target
  end

  def parse(filename) do
    text = File.read!(filename)
    [target | items] = tokenize(text)
    [String.to_float(target), Item.parse(items)]
  end

  def tokenize(text) do
    String.strip(text)
      |> String.replace("$", "")
      |> String.split("\n")
  end
end
