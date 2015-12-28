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
      test_paths: ["_test"],
      elixirc_paths: elixirc_paths(Mix.env),
   ]
  end

  def application do
    [applications: [:yamerl]]
  end

  defp elixirc_paths(:test), do: ["_test/support"]
  defp elixirc_paths(_),     do: []

  defp deps do
    [
      # Automatic test runner
      {:mix_test_watch, only: :dev},
      # Style linter
      {:dogma, only: ~w(dev test)a},
      # yml parser
      {:yamerl, github: "yakaz/yamerl"}
    ]
  end
end
