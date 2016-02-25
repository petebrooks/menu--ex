defmodule Menu.Item do
  defstruct name: "", price: 0

  alias Menu.Item

  def with_price(items) do
    Enum.filter(items, &(&1.price > 0))
  end

  def total_price(items) do
    prices(items) |> Enum.sum |> Float.round(2)
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
    [name, price_string] = String.split(item, ",")
    {price, _} = Float.parse(price_string)
    %Item{name: name, price: price}
  end
end
