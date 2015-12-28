defmodule SlimeReference.Mixfile do
  use Mix.Project

  def project do
    [
      app: :slime_reference,
      version: "0.0.1",
      elixir: "~> 1.0",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
   ]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [
      # Automatic test runner
      {:mix_test_watch, only: :dev},
      # Style linter
      {:dogma, only: ~w(dev test)a},
    ]
  end
end
