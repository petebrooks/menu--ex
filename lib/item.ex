defmodule Item do
  defstruct name: "", price: 0

  def total_price(items) do
    prices(items) |> Enum.sum
  end

  def prices(items) do
    Enum.map(items, &(&1.price))
  end

  def min_price(items) do
    prices(items) |> Enum.min
  end

  def parse(items) when is_list(items) do
    Enum.map(items, &parse/1)
  end

  def parse(item) do
    [name, price] = String.split(item, ",")
    %Item{name: name, price: String.to_float(price)}
  end
end
