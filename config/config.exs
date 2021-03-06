# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :friendship, Friendship.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "oxYv7MUw4rx5VnKfow94DAsaSBMfVEr7LFxpzgAjN/2F4NiBeJw+NqzlNa/TYUl0",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Friendship.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :ex_admin, 
  repo: Friendship.Repo,
  module: Friendship,
  modules: [
    Friendship.ExAdmin.Dashboard,
    Friendship.ExAdmin.User
  ]

config :xain, :quote, "'"
config :xain, :after_callback, {Phoenix.HTML, :raw}

config :passport,
  resource: Friendship.User,
  repo: Friendship.Repo

