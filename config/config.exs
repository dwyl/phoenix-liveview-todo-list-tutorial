# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_view_todo,
  ecto_repos: [LiveViewTodo.Repo]

# Configures the endpoint
config :live_view_todo, LiveViewTodoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mve+k9ilc/5gZAQOxZ2kc5VRJX3JwxXoyLyteev/xpDLavBZ5XP9JqehJs96PGwB",
  render_errors: [view: LiveViewTodoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveViewTodo.PubSub,
  live_view: [signing_salt: "gJUPwnsw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
