defmodule SolverTest do
  use ExUnit.Case
  import Menu.Solver, only: [solve: 2, total_price_matches?: 2, max_possible_items: 2]
  alias Menu.Item

  doctest Menu.Solver


  ####################
  # Simple menu
  ####################
  def simple_items do
    [%Item{name: "juice", price: 0.23}, %Item{name: "snacks", price: 0.5}]
  end

  test "solve simple menu" do
    assert solve(1.23, simple_items) ==
      [[%Item{name: "juice", price: 0.23}, %Item{name: "snacks", price: 0.5}, %Item{name: "snacks", price: 0.5}]]
  end

  test "total_price_matches?" do
    assert total_price_matches?(simple_items, 0.73) == true
    assert total_price_matches?(simple_items, 1.23) == false
  end

  test "max_possible_items" do
    assert max_possible_items(simple_items, 1.23) == 5
  end

  ####################
  # Zero menu
  ####################
  def zero_items do
    [%Item{name: "juice", price: 0.23}, %Item{name: "free snacks", price: 0}, %Item{name: "snacks", price: 0.5}]
  end

  test "solve zero menu" do
    assert solve(1.23, zero_items) ==
      [[%Item{name: "juice", price: 0.23}, %Item{name: "snacks", price: 0.5}, %Item{name: "snacks", price: 0.5}]]
  end

end
