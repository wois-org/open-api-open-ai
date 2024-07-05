import Config

config :oapi_open_ai,
  api_key: "your-api-key"

if config_env() in [:dev, :test] do
  import_config "#{config_env()}.exs"
end
