use Mix.Config

# log everything so we can debug
config :logger, level: :info

import_config "prod.secret.exs"
