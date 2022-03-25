import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :volunteer_opp_db, VolunteerOppDb.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "volunteer_opp_db_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :volunteer_opp_db, VolunteerOppDbWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "jX6GnHSSmtLq26Jri3UOUkkglU46a/8fz0dlH1soDQs7JaA4Cff3WNVHI2sp/hM5",
  server: false

# In test we don't send emails.
config :volunteer_opp_db, VolunteerOppDb.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
