defmodule CLITest do
  use ExUnit.Case

  import Menu.CLI

  test "returns :help when passed -h and --help options" do
    assert parse_args(["-h"]) == :help
    assert parse_args(["--help"]) == :help
  end

  test "returns :help when passed no arguments" do
    assert parse_args([""]) == :help
  end

  test "returns a filepath when passed any other argument" do
    assert parse_args(["path/to/file"]) == "path/to/file"
  end

end