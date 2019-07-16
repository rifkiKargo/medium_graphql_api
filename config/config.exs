# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :medium_graphql_api,
  ecto_repos: [MediumGraphqlApi.Repo]

# Configures the endpoint
config :medium_graphql_api, MediumGraphqlApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "a0ZsW3YFj3l4EIw0AFaxjs11n9iraD9dfmN9oE03rB2woRZhFIEtutKHAQQ5ty5n",
  render_errors: [view: MediumGraphqlApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MediumGraphqlApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config details
config :medium_graphql_api, MediumGraphqlApi.Guardian,
  issuer: "medium_graphql_api",
  secret_key: "XxRyjk63ijkEU7dZyuSjbC2bl1RXvHI4Pwt/cfx+MmFoUFdkHSt8gecLvJLNlhkG"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
