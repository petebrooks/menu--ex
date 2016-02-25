defmodule DocTest do
  use ExUnit.Case
  doctest Menu.CLI
  doctest Menu.Solver
  doctest Menu.Parser
  doctest Menu.Item
end
