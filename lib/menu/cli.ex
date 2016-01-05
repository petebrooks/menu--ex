defmodule Menu.CLI do
  alias Menu.Parser
  alias Menu.Solver

  def run(argv) do
    argv |> parse_args |> process
  end

  def process(:help) do
    IO.puts "usage menu <path/to/menu>"
  end

  def process(filepath) do
    [target | [items]] = Parser.parse(filepath)
    IO.inspect Solver.solve(target, items)
  end

  def parse_args(argv) do
    args = OptionParser.parse(argv, switches: [help: :boolean],
                                    aliases:  [h: :help])
    case args do
      { [help: true], _, _ } -> :help
      { _, [""], _ }         -> :help
      { _, [filepath], _ }   -> filepath
    end
  end
end