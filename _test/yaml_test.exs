defmodule YamlTest do
  use ExUnit.Case

  test "reading a yml file" do
    yml = YAML.read("_test/fixtures/example.yml")
    assert yml == [
      %{
        "title" => "Hello",
        "text"  => "world",
      },
      %{
        "title" => "Goodbye",
        "text"  => "world",
      },
    ]
  end
end
