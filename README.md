# OpenAi REST API Client for Elixir
[![Coverage Status](https://coveralls.io/repos/github/wois-org/open-api-open-ai/badge.svg?branch=master)](https://coveralls.io/github/wois-org/open-api-open-ai?branch=master)
[![Hex.pm Vesion](https://img.shields.io/hexpm/v/oapi_open_ai.svg)]()
[![Hex.pm Downloads](https://img.shields.io/hexpm/dt/oapi_open_ai.svg)]()
[![Hex.pm Downloads/week](https://img.shields.io/hexpm/dw/oapi_open_ai.svg)]()

This library uses an [OpenAPI Code Generator](https://github.com/aj-foster/open-api-generator) that has the flexibility to wrangle the generated code into an ergonomic client.

## Installation

The package can be installed by adding `oapi_open_ai` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:oapi_open_ai, "~> 0.1.0"}
  ]
end
```

## Configuration
You can configure openai in your mix config.exs (default $project_root/config/config.exs). If you're using Phoenix add the configuration in your config/dev.exs|test.exs|prod.exs files. An example config is:

```elixir
config :oapi_open_ai,
  # find it at https://platform.openai.com/account/api-keys
  api_key: "your-api-key",
  # optional, use when required by an OpenAI API beta, e.g.:
  beta: "assistants=v1",
  # optional, HTTP client defaults to HTTPoison, useful for mocking in tests
  http_client: HTTPoisonMock,
  # optional, passed to [HTTPoison.Request](https://hexdocs.pm/httpoison/HTTPoison.Request.html) options
  http_options: [recv_timeout: 30_000]
```
Note: you can load your os ENV variables in the configuration file, if you set an env variable for API key named `OPENAI_API_KEY` you can get it in the code by doing `System.get_env("OPENAI_API_KEY")`.

More info on possible `http_options` configuration: [HTTPoison.Request](https://hexdocs.pm/httpoison/HTTPoison.Request.html)

⚠️`config.exs` is compile time, so the `get_env/1` function is executed during the build, if you want to get the env variables during runtime please use `runtime.exs` instead of `config.exs` in your application ([elixir doc ref](https://elixir-lang.org/getting-started/mix-otp/config-and-releases.html#configuration)).

## Usage
All of the client operations are generated based on the OpenAPI description provided by GitHub.

All the operations are listed in [lib/operations](/lib/operations)

Generally you should expect something like
```elixir
OpenAI.{{Resource}}.{{operation}}(...params...)
```

Where:
* {{Resource}} is the name of the resource as tagged by OpenAI, I.E `Assistants`, `Audio`, `Cat`, ...etc
* {{operation}} is the name of request directed to resource
* ...params... are the parameters which are required to make a request

### Assistants
Assistants section of documentation does not match 1 to 1 to [OpenAI Api documentation](https://platform.openai.com/docs/api-reference/). This is due to how OpenAPI configuration is written by OpenAI. 
Resources "Messages", "Runs" and "RunsSteps" are merged into `OpenAi.Assistants`. And "VectorStoresFiles" and "VectorStoresFileBatches" are merged into `OpenAi.VectorStores`.

## Contributing

Because this library uses a code generator for the majority of its mass, there are two modes of contribution.
Please consider these when creating issues or opening pull requests:

* If the generated code is out of date, the fix may be as simple as:
  1. Updating OpenAI yaml configuration in /config/openai.yaml 
    Its possible to get new config from [OpenAI GiHub](https://github.com/openai/openai-openapi/blob/master/openapi.yaml)
  2. Running `mix generate`.
* If the client isn't working as expected, the fix may be more involved and require careful thought and versioning.

For more on what this means to you as a contributor, please see the [contribution guidelines](CONTRIBUTING.md).
