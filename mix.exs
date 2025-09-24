defmodule OpenExAi.MixProject do
  alias OpenAi.Realtime
  use Mix.Project

  def project do
    [
      app: :oapi_open_ai,
      version: "1.0.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      name: "OpenAI REST API Client",
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      docs: docs(),
      aliases: aliases(),
      package: package(),
      test_coverage: [tool: ExCoveralls]
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
      # {:oapi_generator, "~> 0.2", only: :dev, runtime: false},
      # {:oapi_generator, git: "git@github.com:aj-foster/open-api-generator.git", branch: "main", only: :dev, runtime: false},
      {:oapi_generator, path: "../wois/open-api-generator", only: :dev},
      {:httpoison, "~> 2.0"},
      {:poison, "~> 5.0"},
      {:mox, "~> 1.0", only: :test},
      {:version_release, "0.5.3", only: :dev, runtime: false},
      {:excoveralls, "~> 0.13", only: [:test, :dev]}
    ]
  end

  defp elixirc_paths(_), do: ["lib", "test/mocks"]

  defp aliases do
    [
      generate: ["api.gen default ./config/openai.yaml"],
      gen_base: ["api.gen base ./config/openai.yaml"]
    ]
  end

  defp docs() do
    [
      main: "readme",
      source_url: "https://github.com/wois-org/open-api-open-ai",
      source_ref: "master",
      extras: [
        "README.md": [title: "Overview"],
        "CHANGELOG.md": [title: "Changelog"],
        "CODE_OF_CONDUCT.md": [title: "Code of Conduct"],
        "CONTRIBUTING.md": [title: "Contributing"],
        "STYLE_GUIDE.md": [title: "Style Guide"],
        LICENSE: [title: "License"]
      ],
      groups_for_modules: [
        Client: [
          OpenAi,
          OpenAi.Client,
          OpenAi.Config,
          OpenAi.Client.Stream
        ],
        "Responses API": [
          OpenAi.Responses,
          OpenAi.Conversations
        ],
        Webhooks: [],
        "Platform APIs": [
          OpenAi.Audio,
          OpenAi.Images,
          OpenAi.Embeddings,
          OpenAi.Evals,
          OpenAi.FineTuning,
          OpenAi.Grades,
          OpenAi.Batch,
          OpenAi.Files,
          OpenAi.Models,
          OpenAi.Moderations
        ],
        "Vector Stores": [
          OpenAi.VectorStores,
          "OpenAi.VectorStoresFiles",
          "OpenAi.VectorStoresFileBatches"
        ],
        Containers: [
          "OpenAi.Containers",
          "OpenAi.ContainerFiles",
        ],
        Realtime: [
          OpenAi.Realtime,
          "OpenAi.ClientSecrets",
          "OpenAi.ClientEvents",
          "OpenAi.ServerEvents"
        ],
        "Chat Completions": [
          OpenAi.Chat
        ],
        Assistants: [
          OpenAi.Assistants,
          "OpenAi.Threads",
          "OpenAi.Messages",
          "OpenAi.Runs",
          "OpenAi.RunsSteps",
          "OpenAi.Streaming"
        ],
        Administration: [
          OpenAi.Operations,
          OpenAi.AdminApiKey,
          OpenAi.Invites,
          OpenAi.Users,
          OpenAi.Projects,
          OpenAi.Project.User,
          OpenAi.Project.ServiceAccount,
          OpenAi.Project.ApiKey,
          OpenAi.Project.RateLimit,
          OpenAi.AuditLogs,
          OpenAi.Usage,
          OpenAi.Certificates
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
