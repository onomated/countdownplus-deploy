import Config

# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it is typically used to load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.
# The block below contains prod specific runtime configuration.
if config_env() == :prod do
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

  # The secret key base is used to sign/encrypt cookies and other secrets.
  # A default value is used in config/dev.exs and config/test.exs but you
  # want to use a different value for prod and you most likely don't want
  # to check this value into version control, so we use an environment
  # variable instead.
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
  maybe_ipv6 = if System.get_env("ECTO_IPV6"), do: [:inet6], else: []
  host = System.get_env("HOST")
  scheme = System.get_env("SCHEME") || "https"
  port = if scheme === "https", do: 8080, else: 80
  server_port = String.to_integer(System.get_env("PORT") || "4000")

  config :countdownplus,
    secret_key_base: secret_key_base

  config :countdownplus, Countdownplus.Repo,
    # ssl: true,
    url: database_url,
    pool_size: pool_size,
    socket_options: maybe_ipv6

  config :countdownplus, Countdownplus.LegacyRepo,
    # ssl: true,
    url: legacy_database_url,
    pool_size: pool_size,
    socket_options: maybe_ipv6

  config :countdownplus_web, CountdownplusWeb.Endpoint,
    url: [scheme: scheme, host: host, port: port],
    http: [
      # Enable IPv6 and bind on all interfaces.
      # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: server_port,
      transport_options: [socket_opts: [:inet6]]
    ],
    secret_key_base: secret_key_base

  # ## Using releases
  #
  # If you are doing OTP releases, you need to instruct Phoenix
  # to start each relevant endpoint:

  config :countdownplus_web, CountdownplusWeb.Endpoint, server: true

  # ## Configuring the mailer
  #
  # In production you need to configure the mailer to use a different adapter.
  # Also, you may need to configure the Swoosh API client of your choice if you
  # are not using SMTP. Here is an example of the configuration:
  #
  #     config :countdownplus, Countdownplus.Mailer,
  #       adapter: Swoosh.Adapters.Mailgun,
  #       api_key: System.get_env("MAILGUN_API_KEY"),
  #       domain: System.get_env("MAILGUN_DOMAIN")
  #
  # For this example you need include a HTTP client required by Swoosh API client.
  # Swoosh supports Hackney and Finch out of the box:
  #
  #     config :swoosh, :api_client, Swoosh.ApiClient.Hackney
  #
  # See https://hexdocs.pm/swoosh/Swoosh.html#module-installation for details.
  config :countdownplus, Countdownplus.Notifications.EmailDispatcher,
    adapter: Swoosh.Adapters.AmazonSES,
    region: System.get_env("AWS_REGION"),
    access_key: System.get_env("AWS_ACCESS_KEY_ID"),
    secret: System.get_env("AWS_SECRET_ACCESS_KEY")
end
