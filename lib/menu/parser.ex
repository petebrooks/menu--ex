defmodule Menu.Parser do
  alias Menu.Item

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