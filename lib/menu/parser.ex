defmodule Menu.Parser do
  alias Menu.Item

  def parse(filename) do
    [target | items] = File.read!(filename) |> tokenize
    [String.to_float(target), Item.parse(items)]
  end

  def tokenize(text) do
    String.strip(text)
      |> String.replace("$", "")
      |> String.split("\n")
  end
end
