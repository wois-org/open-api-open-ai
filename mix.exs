defmodule OpenExAi.MixProject do
  use Mix.Project

  def project do
    [
      app: :oapi_open_ai,
      version: "0.3.3",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      name: "OpenAI REST API Client",
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      docs: docs(),
      aliases: aliases(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.7", runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},
      {:oapi_generator, "~> 0.1.1", only: :dev, runtime: false},
      {:httpoison, "~> 2.0"},
      {:poison, "~> 5.0"},
      {:mox, "~> 1.0", only: :test},
      {:version_release, "0.5.3", only: :dev, runtime: false}
    ]
  end

  defp elixirc_paths(_), do: ["lib", "test/mocks"]

  defp aliases do
    [
      generate: ["api.gen default ./config/openai.yaml"]
    ]
  end

  defp docs() do
    [
      main: "readme",
      extras: [
        "README.md": [title: "Overview"],
        "CHANGELOG.md": [title: "Changelog"],
        "CODE_OF_CONDUCT.md": [title: "Code of Conduct"],
        "CONTRIBUTING.md": [title: "Contributing"],
        LICENSE: [title: "License"]
      ],
      groups_for_modules: [
        Client: [
          OpenAi,
          OpenAi.Client,
          OpenAi.Config
        ],
        Endpoints: [
          OpenAi.Audio,
          OpenAi.Chat,
          OpenAi.Embeddings,
          OpenAi.FineTuning,
          OpenAi.Batch,
          OpenAi.Files,
          OpenAi.Images,
          OpenAi.Models,
          OpenAi.Moderations
        ],
        Assistants: [
          OpenAi.Assistants,
          "OpenAi.Messages",
          "OpenAi.Runs",
          "OpenAi.RunsSteps",
          OpenAi.VectorStores,
          "OpenAi.VectorStoresFiles",
          "OpenAi.VectorStoresFileBatches"
        ],
        Legacy: [
          OpenAi.Completions,
          "OpenAi.Assistants(v1)",
          "OpenAi.Threads(v1)",
          "OpenAi.Messages(v1)",
          "OpenAi.Runs(v1)",
          "OpenAi.Streaming(v1)"
        ],
        Operations: [
          # OpenAi.Assistants,
          # OpenAi.Audio,
          # OpenAi.Batch,
          # OpenAi.Chat,
          # OpenAi.Completions,
          # OpenAi.Embeddings,
          # OpenAi.Files,
          # OpenAi.FineTuning,
          # OpenAi.Images,
          # OpenAi.Models,
          # OpenAi.Moderations,
          # OpenAi.VectorStores
        ],
        Testing: ~r/OpenAi.Mocks/,
        Schemas: ~r//
      ]
    ]
  end

  defp package() do
    [
      description: "OpenAI REST API Client",
      files: [
        "lib",
        "test/mocks",
        "mix.exs",
        "README.md",
        "LICENSE",
        "CODE_OF_CONDUCT.md",
        "CONTRIBUTING.md",
        "STYLE_GUIDE.md"
      ],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/wois-org/open-api-open-ai"
      }
    ]
  end
end
