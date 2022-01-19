# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

legacy_database_url =
  System.get_env("LEGACY_DATABASE_URL") ||
    raise """
    environment variable LEGACY_DATABASE_URL is missing.
    Be sure to use readonly replica for legacy database
    For example: ecto://USER:PASS@HOST/DATABASE
    """

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

# Ensure other required/default vars
required_vars = ["HOST", "AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY", "AWS_REGION"]

for var <- required_vars do
  System.get_env(var) ||
    raise """
    required environment variable ${var} is missing.
    """
end

pool_size = String.to_integer(System.get_env("POOL_SIZE") || "92")
host = System.get_env("HOST")
scheme = System.get_env("SCHEME") || "https"
port = if scheme === "https", do: 8080, else: 80
server_port = 4000

config :countdownplus,
  secret_key_base: secret_key_base

config :countdownplus, Countdownplus.Repo,
  # ssl: true,
  url: database_url,
  pool_size: pool_size

config :countdownplus, Countdownplus.LegacyRepo,
  # ssl: true,
  url: legacy_database_url,
  pool_size: pool_size

config :countdownplus_web, CountdownplusWeb.Endpoint,
  url: [scheme: scheme, host: host, port: port],
  http: [
    port: server_port,
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:

config :countdownplus_web, CountdownplusWeb.Endpoint, server: true

# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
