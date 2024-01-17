defmodule Conta.MixProject do
  use Mix.Project

  def project do
    [
      app: :conta,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Conta, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:commanded, "~> 1.4"},
      {:jason, "~> 1.4"},
      {:commanded_eventstore_adapter, "~> 1.4"},
      {:commanded_ecto_projections, "~> 1.3"},
      {:money, "~> 1.12"},
      {:dns_cluster, "~> 0.1"},
      {:phoenix_pubsub, "~> 2.1"},
      {:swoosh, "~> 1.14"},
      {:finch, "~> 0.17"},
      {:doctor, "~> 0.21", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.31", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:mix_audit, "~> 2.1", only: [:dev, :test], runtime: false},
      {:ex_check, "~> 0.15", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      reset_es: ~w[event_store.drop event_store.create event_store.init],
      reset_db: ~w[ecto.drop ecto.create ecto.migrate],
      test: ["reset_es", "reset_db", "test --cover"]
    ]
  end
end
