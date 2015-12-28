defmodule ReferenceTest do
  use ExUnit.Case

  paths = "_data/*.yml" |> Path.wildcard

  {:ok, counter} = Agent.start_link fn-> 0 end


  for path     <- paths,
      document = YAML.read(path),
      section  <- document,
      section["slime"],
      section["output"]
  do
    n = Agent.get counter, fn x -> x end
    Agent.update  counter, fn x -> x + 1 end

    test "code example #{n} (in #{path})" do

    end
  end
end
