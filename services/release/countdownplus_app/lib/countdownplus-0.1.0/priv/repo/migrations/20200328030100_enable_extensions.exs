defmodule Countdownplus.Repo.Migrations.EnableExtensions do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""
    execute "CREATE EXTENSION IF NOT EXISTS postgis", ""
    execute "CREATE EXTENSION IF NOT EXISTS pg_trgm", ""
    execute "CREATE EXTENSION IF NOT EXISTS btree_gist", ""
  end
end
