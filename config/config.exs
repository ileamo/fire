# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :fire, FireWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tJG1BpGwBarXtQONesmWEladVYNwh8euDEeJQ8NzbwwUAp5xve6tycKCDz/SKLIT",
  render_errors: [view: FireWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Fire.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "bysgYsxP2IuuyYly9IuPBy1jhQbG5cf5dqOdEtMSsGSI+yXORIy7stG78dufF3jb"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
