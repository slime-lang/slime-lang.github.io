defmodule HTML do
  @moduledoc """
  A rubbishy minifier that is used to check whether HTML is
  effectively equivalent.
  """

  def minify(html) do
    html
    |> String.replace(~r/ +$/m, "")
    |> String.replace(~r/^ +/m, "")
    |> String.replace("\n", "")
  end
end
