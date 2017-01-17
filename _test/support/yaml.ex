defmodule YAML do
  def read(file) do
    file
    |> :yamerl_constr.file
    |> hd
    |> Enum.map(&to_string_map/1)
  end

  def read_reference_examples do
    "_data/reference.yml"
      |> :yamerl_constr.file
      |> hd
      |> Enum.map(fn x -> Enum.into(x, %{}) end)
      |> Enum.flat_map(fn section -> section['examples'] end)
      |> Enum.map(&to_string_map/1)
  end

  defp to_string_map(proplist) do
    for {key, val} <- proplist, into: %{} do
      k = key |> to_string
      v = val |> to_string
      {k, v}
    end
  end
end
