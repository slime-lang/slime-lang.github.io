defmodule ReferenceTest do
  use ExUnit.Case
  require Slime

  {:ok, counter} = Agent.start_link fn-> 0 end

  for example <- YAML.read_reference_examples,
      example["slime"],
      example["output"]
  do
    n = Agent.get counter, fn x -> x end
    Agent.update  counter, fn x -> x + 1 end

    test "code example #{n}" do
      slime    = unquote(example["slime"])
      expected = unquote(example["output"])
      output   = slime |> Slime.render
      assert HTML.minify(expected) == output
    end
  end
end
