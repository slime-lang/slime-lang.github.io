defmodule YAML do
  def read(file) do
    file
    |> :yamerl_constr.file
    |> hd
    |> Enum.map(&to_map/1)
  end

  defp to_map(proplist) do
    for {key, val} <- proplist, into: %{} do
      k = key |> to_string
      v = val |> to_string
      {k, v}
    end
  end
end
