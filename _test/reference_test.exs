defmodule ReferenceTest do
  use ExUnit.Case
  require Slime

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
      slime    = unquote(section["slime"])
      expected = unquote(section["output"])
      output   = slime |> Slime.render
      assert HTML.minify(expected) == output
    end
  end
end
